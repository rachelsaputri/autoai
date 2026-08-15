#!/usr/bin/env bash
#
# Low-Level Memory Management & Network Protocol Simulator
# -------------------------------------------------------
# A comprehensive Bash-based simulation of:
#   1. Memory Allocation (malloc/free with coalescing)
#   2. TCP-like Packet Flow (syn/ack/data/fin)
#   3. Network Routing (ARP, TTL, forwarding)
#
# Usage:
#   ./mem_net_sim.sh mem [--heap-size N] [--alloc-size N] ...
#   ./mem_net_sim.sh net [--src-ip IP] [--dst-ip IP] [--payload TEXT] [--loss-rate R]
#   ./mem_net_sim.sh all [--heap-size N] [--alloc-size N] [--payload TEXT] ...
#
# Author: Autonomous AI Polyglot Software Engineer
# Language: Bash (POSIX-compatible extensions)

set -euo pipefail

# ============================================================================
# GLOBAL STATE
# ============================================================================
declare -a HEAP_BLOCKS=()          # Heap blocks: "id|start|size|status|coalesced"
declare -i HEAP_TOTAL_SIZE=0       # Total heap size
declare -i HEAP_NEXT_ID=0          # Next block ID for allocation
declare -i HEAP_ALLOCATED_SIZE=0   # Total allocated bytes
declare -a NETWORK_PACKETS=()      # Queue of network packets
declare -i NET_SEQ_NUM=0           # TCP sequence number
declare -i NET_WND_SIZE=1024       # TCP window size
declare -i NET_RETRIES=3           # Max retransmission attempts

# Routing table: "dest_network|mask|gateway|interface|metric"
declare -a ROUTING_TABLE=(
    "192.168.1.0|255.255.255.0|192.168.1.1|eth0|100"
    "10.0.0.0|255.0.0.0|10.0.0.254|eth1|50"
    "0.0.0.0|0.0.0.0|192.168.1.1|eth0|0"
)

# ARP cache: "ip -> mac"
declare -A ARP_CACHE=()

# ============================================================================
# UTILITY FUNCTIONS
# ============================================================================

log_info() {
    echo "[INFO] $(date '+%Y-%m-%d %H:%M:%S') $*"
}

log_warn() {
    echo "[WARN] $(date '+%Y-%m-%d %H:%M:%S') $*"
}

log_error() {
    echo "[ERROR] $(date '+%Y-%m-%d %H:%M:%S') $*"
}

# Generate a pseudo-random number between 0 and max-1
rand_range() {
    local max=$1
    echo $(( RANDOM % max ))
}

# Simulate packet loss based on loss rate (0.0 to 1.0)
should_drop_packet() {
    local loss_rate=$1
    local roll
    roll=$(rand_range 100)
    local threshold
    threshold=$(echo "$loss_rate * 100" | bc | cut -d. -f1)
    threshold=${threshold:-0}
    (( roll < threshold ))
}

# ============================================================================
# MEMORY MANAGEMENT SIMULATOR
# ============================================================================

mem_init_heap() {
    local heap_size=$1
    HEAP_TOTAL_SIZE=$heap_size
    HEAP_BLOCKS=("0|0|${heap_size}|free|false")
    HEAP_NEXT_ID=1
    HEAP_ALLOCATED_SIZE=0
    log_info "Heap initialized: ${heap_size} bytes, 1 free block."
}

# Best-fit allocation algorithm
mem_best_fit_alloc() {
    local size=$1
    local best_idx=-1
    local best_size=999999999

    for i in "${!HEAP_BLOCKS[@]}"; do
        IFS='|' read -r bid bstart bsize bstatus bcoalesced <<< "${HEAP_BLOCKS[$i]}"
        if [[ "$bstatus" == "free" ]] && (( bsize >= size )); then
            if (( bsize < best_size )); then
                best_size=$bsize
                best_idx=$i
            fi
        fi
    done

    if (( best_idx == -1 )); then
        log_error "Allocation failed: No contiguous block of size ${size} found."
        return 1
    fi

    IFS='|' read -r old_id old_start old_size old_status old_coalesced <<< "${HEAP_BLOCKS[$best_idx]}"

    # Split block if there's leftover space (min 8 bytes for alignment)
    if (( old_size - size >= 8 )); then
        local new_start=$(( old_start + size ))
        local new_size=$(( old_size - size ))
        HEAP_BLOCKS[$best_idx]="${old_id}|${old_start}|${size}|allocated|false"
        HEAP_BLOCKS+=("${HEAP_NEXT_ID}|${new_start}|${new_size}|free|false")
        (( HEAP_NEXT_ID++ ))
    else
        HEAP_BLOCKS[$best_idx]="${old_id}|${old_start}|${size}|allocated|false"
    fi

    (( HEAP_ALLOCATED_SIZE += size ))
    log_info "Allocated ${size} bytes at block ${old_id} (offset ${old_start})."
    echo "BLOCK_ID:${old_id}"
    return 0
}

mem_free_block() {
    local target_id=$1
    local freed_idx=-1

    for i in "${!HEAP_BLOCKS[@]}"; do
        IFS='|' read -r bid bstart bsize bstatus bcoalesced <<< "${HEAP_BLOCKS[$i]}"
        if (( bid == target_id )) && [[ "$bstatus" == "allocated" ]]; then
            freed_idx=$i
            break
        fi
    done

    if (( freed_idx == -1 )); then
        log_error "Free failed: No allocated block with ID ${target_id} found."
        return 1
    fi

    IFS='|' read -r _ old_start old_size _ _ <<< "${HEAP_BLOCKS[$freed_idx]}"
    HEAP_BLOCKS[$freed_idx]="${target_id}|${old_start}|${old_size}|free|false"
    (( HEAP_ALLOCATED_SIZE -= old_size ))
    log_info "Freed block ${target_id} (${old_size} bytes)."

    # Coalesce adjacent free blocks
    mem_coalesce_blocks
    return 0
}

mem_coalesce_blocks() {
    local changed=true
    while $changed; do
        changed=false
        for i in "${!HEAP_BLOCKS[@]}"; do
            IFS='|' read -r bid1 start1 size1 status1 _ <<< "${HEAP_BLOCKS[$i]}"
            if [[ "$status1" != "free" ]]; then continue; fi

            for j in "${!HEAP_BLOCKS[@]}"; do
                if (( i == j )); then continue; fi
                IFS='|' read -r bid2 start2 size2 status2 _ <<< "${HEAP_BLOCKS[$j]}"
                if [[ "$status2" != "free" ]]; then continue; fi

                # Check adjacency
                local end1=$(( start1 + size1 ))
                local end2=$(( start2 + size2 ))
                if (( end1 == start2 )); then
                    # Merge j into i
                    HEAP_BLOCKS[$i]="${bid1}|${start1}|$(( size1 + size2 ))|free|false"
                    unset 'HEAP_BLOCKS[j]'
                    HEAP_BLOCKS=("${HEAP_BLOCKS[@]}") # Re-index
                    changed=true
                    break
                elif (( end2 == start1 )); then
                    # Merge i into j
                    HEAP_BLOCKS[$j]="${bid2}|${start2}|$(( size1 + size2 ))|free|false"
                    unset 'HEAP_BLOCKS[i]'
                    HEAP_BLOCKS=("${HEAP_BLOCKS[@]}") # Re-index
                    changed=true
                    break
                fi
            done
        done
    done
    log_info "Coalescing complete."
}

mem_heap_analysis() {
    local free_count=0
    local alloc_count=0
    local max_free=0
    local total_free=0
    local free_sizes=()

    for block in "${HEAP_BLOCKS[@]}"; do
        IFS='|' read -r _ _ bsize bstatus _ <<< "$block"
        if [[ "$bstatus" == "free" ]]; then
            (( free_count++ ))
            (( total_free += bsize ))
            free_sizes+=("$bsize")
            (( bsize > max_free )) && max_free=$bsize
        else
            (( alloc_count++ ))
        fi
    done

    local external_frag=0
    if (( total_free > 0 )); then
        external_frag=$(( total_free - max_free ))
    fi

    local fragmentation_pct=0
    if (( HEAP_TOTAL_SIZE > 0 )); then
        fragmentation_pct=$(( external_frag * 100 / HEAP_TOTAL_SIZE ))
    fi

    log_info "=== Heap Analysis ==="
    log_info "Total Heap Size: ${HEAP_TOTAL_SIZE} bytes"
    log_info "Allocated: ${HEAP_ALLOCATED_SIZE} bytes (${alloc_count} blocks)"
    log_info "Free Space: ${total_free} bytes (${free_count} blocks, max contiguous: ${max_free})"
    log_info "External Fragmentation: ${external_frag} bytes (${fragmentation_pct}%)"
    log_info "======================"
}

mem_dump_heap() {
    log_info "=== Heap Dump ==="
    printf "%-6s %-10s %-10s %-10s\n" "ID" "Start" "Size" "Status"
    printf "%-6s %-10s %-10s %-10s\n" "---" "-----" "----" "------"
    for block in "${HEAP_BLOCKS[@]}"; do
        IFS='|' read -r bid bstart bsize bstatus _ <<< "$block"
        printf "%-6s %-10s %-10s %-10s\n" "$bid" "$bstart" "$bsize" "$bstatus"
    done
    log_info "================="
}

# ============================================================================
# NETWORK PROTOCOL SIMULATOR
# ============================================================================

# Parse IP address to 32-bit integer
ip_to_int() {
    local ip=$1
    IFS='.' read -r a b c d <<< "$ip"
    echo $(( (a << 24) + (b << 16) + (c << 8) + d ))
}

# Convert 32-bit integer to IP address
int_to_ip() {
    local num=$1
    echo "$(( (num >> 24) & 255 )).$(( (num >> 16) & 255 )).$(( (num >> 8) & 255 )).$(( num & 255 ))"
}

# Apply mask
ip_masked() {
    local ip_int=$1
    local mask_int=$2
    echo $(( ip_int & mask_int ))
}

# Generate MAC address
gen_mac() {
    printf "%.2x:%.2x:%.2x:%.2x:%.2x:%.2x" \
        $(( RANDOM % 256 )) $(( RANDOM % 256 )) $(( RANDOM % 256 )) \
        $(( RANDOM % 256 )) $(( RANDOM % 256 )) $(( RANDOM % 256 ))
}

# ARP Resolution
net_arp_resolve() {
    local target_ip=$1
    if [[ -n "${ARP_CACHE[$target_ip]:-}" ]]; then
        log_info "ARP Cache Hit: ${target_ip} -> ${ARP_CACHE[$target_ip]}"
        echo "${ARP_CACHE[$target_ip]}"
        return 0
    fi

    local mac
    mac=$(gen_mac)
    ARP_CACHE[$target_ip]=$mac
    log_info "ARP Resolution: ${target_ip} -> ${mac}"
    echo "$mac"
    return 0
}

# TCP Packet Construction
net_build_packet() {
    local src_ip=$1
    local dst_ip=$2
    local payload=$3
    local src_port=$(( RANDOM % 40000 + 1024 ))
    local dst_port=80
    local ttl=64
    local seq_num=$NET_SEQ_NUM
    local ack_num=0
    local flags="PSH,ACK"
    local window=$NET_WND_SIZE
    local payload_len=${#payload}

    # Simulate sequence number increment
    (( NET_SEQ_NUM += payload_len ))

    echo "|${src_ip}|${dst_ip}|${src_port}|${dst_port}|${seq_num}|${ack_num}|${ttl}|${flags}|${window}|${payload_len}|${payload}|"
}

# Find next hop via routing table
net_find_next_hop() {
    local dst_ip=$1
    local dst_int
    dst_int=$(ip_to_int "$dst_ip")

    local best_metric=999999
    local best_gateway=""
    local best_iface=""
    local best_mac=""

    for route in "${ROUTING_TABLE[@]}"; do
        IFS='|' read -r net mask gw iface metric <<< "$route"
        local net_int mask_int
        net_int=$(ip_to_int "$net")
        mask_int=$(ip_to_int "$mask")

        local net_masked dst_masked
        net_masked=$(ip_masked $net_int $mask_int)
        dst_masked=$(ip_masked $dst_int $mask_int)

        if (( net_masked == dst_masked )); then
            if (( metric <= best_metric )); then
                best_metric=$metric
                best_gateway=$gw
                best_iface=$iface
                best_mac=$(net_arp_resolve "$gw")
            fi
        fi
    done

    if [[ -z "$best_gateway" ]]; then
        log_error "No route to host ${dst_ip}"
        return 1
    fi

    echo "${best_gateway}|${best_iface}|${best_mac}"
}

# Simulate TCP handshake and data transfer
net_simulate_tcp() {
    local src_ip=$1
    local dst_ip=$2
    local payload=$3
    local loss_rate=$4

    log_info "=== TCP Simulation: ${src_ip} -> ${dst_ip} ==="
    log_info "Payload: '${payload}' (${#payload} bytes)"
    log_info "Packet Loss Rate: ${loss_rate}"
    log_info "-------------------------------------------"

    # Step 1: SYN
    log_info "[TCP] Sending SYN to ${dst_ip}"
    local syn_pkt
    syn_pkt=$(net_build_packet "$src_ip" "$dst_ip" "")
    log_info "[TCP] SYN Packet: Seq=0, Flags=SYN"

    # Simulate SYN/ACK
    log_info "[TCP] Received SYN/ACK from ${dst_ip}"
    log_info "[TCP] Sending ACK"

    # Step 2: Data Transfer
    log_info "[TCP] Sending Data: Seq=${NET_SEQ_NUM}, Flags=PSH,ACK"
    local pkt
    pkt=$(net_build_packet "$src_ip" "$dst_ip" "$payload")

    # Extract payload from packet for forwarding
    local raw_pkt="$pkt"
    local payload_extracted="${raw_pkt#*|}"
    payload_extracted="${payload_extracted%|*}"

    # Forward packet
    log_info "[ROUTER] Forwarding packet to ${dst_ip}"
    local next_hop
    next_hop=$(net_find_next_hop "$dst_ip")
    if [[ $? -ne 0 ]]; then
        log_error "[ROUTER] Drop: No route to ${dst_ip}"
        return 1
    fi

    IFS='|' read -r gw iface mac <<< "$next_hop"
    log_info "[ROUTER] Next Hop: ${gw} via ${iface} (MAC: ${mac})"
    log_info "[ROUTER] TTL decremented (now 63)"

    # Simulate packet loss
    if should_drop_packet "$loss_rate"; then
        log_warn "[TCP] Packet Lost! Initiating retransmission."
        local retries=0
        while (( retries < NET_RETRIES )); do
            (( retries++ ))
            log_info "[TCP] Retransmission attempt ${retries}/${NET_RETRIES}"
            sleep 0.1
            if ! should_drop_packet "$loss_rate"; then
                log_info "[TCP] Retransmission successful."
                break
            fi
        done
        if (( retries == NET_RETRIES )); then
            log_error "[TCP] Max retries exceeded. Connection reset."
        fi
    else
        log_info "[TCP] Packet delivered successfully."
    fi

    # Step 3: FIN
    log_info "[TCP] Sending FIN"
    log_info "[TCP] Received FIN/ACK"
    log_info "[TCP] Connection Closed"
    log_info "==========================================="
}

# ============================================================================
# MEMORY + NETWORK INTEGRATED SIMULATION
# ============================================================================

mem_net_sim_all() {
    local heap_size=$1
    shift
    local alloc_sizes=()
    local free_ids=()
    local payload=""
    local loss_rate="0.1"

    # Parse remaining args
    while [[ $# -gt 0 ]]; do
        case $1 in
            --heap-size) heap_size=$2; shift 2 ;;
            --alloc-size) alloc_sizes+=("$2"); shift 2 ;;
            --free-id) free_ids+=("$2"); shift 2 ;;
            --payload) payload="$2"; shift 2 ;;
            --loss-rate) loss_rate="$2"; shift 2 ;;
            *) log_error "Unknown option: $1"; return 1 ;;
        esac
    done

    # Run Memory Simulation
    log_info "==========================================="
    log_info "Phase 1: Memory Management Simulation"
    log_info "==========================================="
    mem_init_heap "$heap_size"
    mem_dump_heap

    local block_ids=()
    for size in "${alloc_sizes[@]}"; do
        local result
        result=$(mem_best_fit_alloc "$size") || true
        if [[ "$result" == BLOCK_ID:* ]]; then
            block_ids+=("${result#BLOCK_ID:}")
        fi
        mem_dump_heap
    done

    for fid in "${free_ids[@]}"; do
        mem_free_block "$fid"
        mem_dump_heap
    done

    mem_heap_analysis

    # Run Network Simulation
    log_info "==========================================="
    log_info "Phase 2: Network Protocol Simulation"
    log_info "==========================================="
    NET_SEQ_NUM=0
    if [[ -z "$payload" ]]; then
        payload="Hello from Memory-Simulated Network!"
    fi
    net_simulate_tcp "192.168.1.100" "10.0.0.1" "$payload" "$loss_rate"

    log_info "==========================================="
    log_info "Simulation Complete."
    log_info "==========================================="
}

# ============================================================================
# COMMAND DISPATCHER
# ============================================================================

dispatch_mem() {
    local heap_size=1024
    local alloc_sizes=()
    local free_ids=()

    while [[ $# -gt 0 ]]; do
        case $1 in
            --heap-size) heap_size=$2; shift 2 ;;
            --alloc-size) alloc_sizes+=("$2"); shift 2 ;;
            --free-id) free_ids+=("$2"); shift 2 ;;
            *) log_error "Unknown option: $1"; return 1 ;;
        esac
    done

    if [[ ${#alloc_sizes[@]} -eq 0 ]]; then
        alloc_sizes=(256 128 64)
    fi
    if [[ ${#free_ids[@]} -eq 0 ]]; then
        free_ids=(1)
    fi

    log_info "==========================================="
    log_info "Memory Management Simulation"
    log_info "==========================================="
    mem_init_heap "$heap_size"
    mem_dump_heap

    local block_ids=()
    for size in "${alloc_sizes[@]}"; do
        local result
        result=$(mem_best_fit_alloc "$size") || true
        if [[ "$result" == BLOCK_ID:* ]]; then
            block_ids+=("${result#BLOCK_ID:}")
        fi
        mem_dump_heap
    done

    for fid in "${free_ids[@]}"; do
        mem_free_block "$fid"
        mem_dump_heap
    done

    mem_heap_analysis
}

dispatch_net() {
    local src_ip="192.168.1.100"
    local dst_ip="10.0.0.1"
    local payload="Default Payload Data"
    local loss_rate="0.1"

    while [[ $# -gt 0 ]]; do
        case $1 in
            --src-ip) src_ip=$2; shift 2 ;;
            --dst-ip) dst_ip=$2; shift 2 ;;
            --payload) payload="$2"; shift 2 ;;
            --loss-rate) loss_rate="$2"; shift 2 ;;
            *) log_error "Unknown option: $1"; return 1 ;;
        esac
    done

    log_info "==========================================="
    log_info "Network Protocol Simulation"
    log_info "==========================================="
    NET_SEQ_NUM=0
    net_simulate_tcp "$src_ip" "$dst_ip" "$payload" "$loss_rate"
}

main() {
    local mode="all"
    local heap_size=1024
    local alloc_sizes=()
    local free_ids=()
    local payload=""
    local loss_rate="0.1"
    local src_ip="192.168.1.100"
    local dst_ip="10.0.0.1"

    while [[ $# -gt 0 ]]; do
        case $1 in
            mem) mode="mem"; shift ;;
            net) mode="net"; shift ;;
            all) mode="all"; shift ;;
            --heap-size) heap_size=$2; shift 2 ;;
            --alloc-size) alloc_sizes+=("$2"); shift 2 ;;
            --free-id) free_ids+=("$2"); shift 2 ;;
            --payload) payload="$2"; shift 2 ;;
            --loss-rate) loss_rate="$2"; shift 2 ;;
            --src-ip) src_ip=$2; shift 2 ;;
            --dst-ip) dst_ip=$2; shift 2 ;;
            *) log_error "Unknown argument: $1"; return 1 ;;
        esac
    done

    case $mode in
        mem) dispatch_mem --heap-size "$heap_size" ${alloc_sizes:+--alloc-size "${alloc_sizes[@]}"} ${free_ids:+--free-id "${free_ids[@]}"} ;;
        net) dispatch_net --src-ip "$src_ip" --dst-ip "$dst_ip" --payload "$payload" --loss-rate "$loss_rate" ;;
        all) mem_net_sim_all "$heap_size" --alloc-size "${alloc_sizes[@]:-256 128}" --free-id "${free_ids[@]:-1}" --payload "$payload" --loss-rate "$loss_rate" ;;
        *) log_error "Invalid mode: $mode"; return 1 ;;
    esac
}

main "$@"
