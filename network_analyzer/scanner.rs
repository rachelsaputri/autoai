use tokio::net::TcpStream;
use tokio::time::{timeout, Duration};
use std::net::SocketAddr;

pub async fn scan_port(addr: SocketAddr, port: u16, timeout_ms: u64) -> bool {
    let target = SocketAddr::new(addr.ip(), port);
    let result = timeout(
        Duration::from_millis(timeout_ms),
        TcpStream::connect(target)
    ).await;

    match result {
        Ok(Ok(_)) => true,
        _ => false,
    }
}

pub async fn scan_range(start_port: u16, end_port: u16, addr: SocketAddr, timeout_ms: u64) -> Vec<u16> {
    let mut open_ports = Vec::new();
    let mut handles = Vec::new();

    for port in start_port..=end_port {
        let addr_clone = addr;
        let timeout_clone = timeout_ms;
        handles.push(tokio::spawn(async move {
            if scan_port(addr_clone, port, timeout_clone).await {
                Some(port)
            } else {
                None
            }
        }));
    }

    for handle in handles {
        if let Some(port_opt) = handle.await.unwrap() {
            if let Some(p) = port_opt {
                open_ports.push(p);
            }
        }
    }

    open_ports
}
