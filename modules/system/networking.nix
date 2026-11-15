{ ... }:

{
  networking = {
    hostName = "firelink";
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      connectionConfig = {
        "ipv4.ignore-auto-dns" = true;
        "ipv6.ignore-auto-dns" = true;
      };
    };
    nftables.enable = true;
    firewall = {
      enable = true;
      allowPing = false;
      allowedUDPPorts = [ 7070 ];
      allowedTCPPorts = [ 7070 ];
    };
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNS = [
        "45.90.28.0#e2d718.dns.nextdns.io"
        "2a07:a8c0::#e2d718.dns.nextdns.io"
        "45.90.30.0#e2d718.dns.nextdns.io"
        "2a07:a8c1::#e2d718.dns.nextdns.io"
        "9.9.9.9#dns.quad9.net"
        "2620:fe::fe#dns.quad9.net"
      ];
      Domains = [ "~." ];
      DNSSEC = true;
      DNSOverTLS = true;
      MulticastDNS = false;
      LLMNR = false;
    };
  };
}
