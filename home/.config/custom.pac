function FindProxyForURL(url, host) {
    // Check if the host is the target IP
    if (host === "192.168.10.193") {
        // Route through SOCKS5 proxy
        return "SOCKS5 127.0.0.1:7777";
    }
    // Direct connection for all other hosts
    return "DIRECT";
}
