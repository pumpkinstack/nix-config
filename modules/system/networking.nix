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
    };
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNS = [
        "45.90.28.225#2c8c2f.dns.nextdns.io"
        "45.90.30.225#2c8c2f.dns.nextdns.io"
        "2a07:a8c0::2c:8c2f#2c8c2f.dns.nextdns.io"
        "2a07:a8c1::2c:8c2f#2c8c2f.dns.nextdns.io"
      ];
      Domains = [ "~." ];
      DNSSEC = true;
      DNSOverTLS = true;
      MulticastDNS = false;
      LLMNR = false;
    };
  };
}