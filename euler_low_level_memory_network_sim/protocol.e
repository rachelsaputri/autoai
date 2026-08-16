;; Simplified Reliable Protocol Simulation (TCP-like)

function init_protocol_stack(window_size) {
    stack = {
        window: window_size,
        seq_num: 1,
        buffer: [],
        acked: []
    };
    return stack;
}

function create_packet(seq_num, payload) {
    pkt = {
        seq: seq_num,
        payload: payload,
        status: "pending"
    };
    return pkt;
}

function send_packet(stack, pkt) {
    ;; Simulate congestion or drop (50% chance for demo)
    if random(1, 100) > 50 {
        printf("[PROTOCOL] Packet 0x%x lost in transit.\n", pkt.seq);
        stack.buffer = append(stack.buffer, pkt);
        return false; ;; Retransmit needed
    }
    
    stack.acked = append(stack.acked, pkt);
    printf("[PROTOCOL] Packet seq %d sent with payload: '%s'\n", pkt.seq, pkt.payload);
    return true;
}

function receive_packet(stack, pkt) {
    ;; Check for duplicate or out-of-order
    for each p in stack.acked {
        if (p.seq == pkt.seq) {
            printf("[PROTOCOL] Duplicate acknowledgment for seq %d.\n", p.seq);
            return;
        }
    }
    
    stack.acked = append(stack.acked, pkt);
    printf("[PROTOCOL] ACK received for seq %d.\n", pkt.seq);
}
