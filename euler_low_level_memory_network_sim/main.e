;; Main Entry Point
module main;

import memory;
import protocol;
import network;

;; Initialize the simulator
function init_simulator() {
    printf("Initializing Low-Level Memory & Network Simulator\n");
    printf("==============================================\n");
    
    ;; Create memory pool
    mem_pool = init_memory_pool(1024 * 1024); ;; 1MB pool
    
    ;; Initialize protocol stack
    protocol_stack = init_protocol_stack(100); ;; Window size 100
    
    ;; Initialize network context
    net_ctx = init_network_context();
    
    printf("Simulator initialized.\n\n");
    
    ;; Run simulation steps
    run_simulation();
}

;; Simulation Logic
function run_simulation() {
    printf("[MEMORY] Allocating 256 bytes...\n");
    addr1 = allocate_memory(mem_pool, 256);
    printf("[MEMORY] Allocated at 0x%x\n", addr1);
    
    printf("[MEMORY] Allocating 1024 bytes...\n");
    addr2 = allocate_memory(mem_pool, 1024);
    printf("[MEMORY] Allocated at 0x%x\n", addr2);
    
    printf("[MEMORY] Freeing 256 bytes at 0x%x...\n", addr1);
    free_memory(mem_pool, addr1, 256);
    
    printf("\n[NETWORK] Starting protocol simulation...\n");
    
    ;; Create packet
    pkt = create_packet(1, "Hello, Network!");
    
    ;; Send through protocol
    result = send_packet(protocol_stack, pkt);
    if result == true {
        printf("[PROTOCOL] Packet sent successfully.\n");
    } else {
        printf("[PROTOCOL] Packet failed or retransmitted.\n");
    }
    
    ;; Simulate acknowledgment
    ack = create_packet(1, "ACK");
    receive_packet(protocol_stack, ack);
    printf("[PROTOCOL] Acknowledgment received.\n");
    
    printf("\n[NETWORK] Simulation complete.\n");
    printf("Final Memory Stats: %d bytes used, %d bytes free.\n", 
           get_used_memory(mem_pool), get_free_memory(mem_pool));
}

;; Run the program
init_simulator();
