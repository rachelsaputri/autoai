;; Basic Network Context and Topology

function init_network_context() {
    ctx = {
        hosts: [],
        bandwidth: 100, ;; Mbps
        latency: 50 ;; ms
    };
    return ctx;
}

function add_host(ctx, hostname, ip) {
    host = { name: hostname, ip: ip, status: "up" };
    ctx.hosts = append(ctx.hosts, host);
    printf("[NETWORK] Host '%s' (IP: %s) added.\n", hostname, ip);
}

function send_data(ctx, src_ip, dst_ip, data) {
    printf("[NETWORK] Sending %d bytes from %s to %s...\n", 
           length(data), src_ip, dst_ip);
    
    ;; Simulate transmission delay
    delay = ctx.latency * length(data) / 1000;
    printf("[NETWORK] Transmission completed in %.2f ms.\n", delay);
}
