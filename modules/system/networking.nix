{ ... }:

{
  networking = {
    hostName = "firelink";
    networkmanager.enable = true;
    networkmanager.dns = "systemd-resolved";
    nftables.enable = true;
    nameservers = [ "127.0.0.53" ];
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
      allowPing = false;
    };
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNS = [
        # "1.1.1.1#cloudflare-dns.com"
        # "9.9.9.9#dns.quad9.net"
        "45.90.28.0#d4868b.dns.nextdns.io"
        "2a07:a8c0::#d4868b.dns.nextdns.io"
      ];
      DNSSEC = true;
      DNSOverTLS = true;
      MulticastDNS = false;
      LLMNR = false;
    };
  };
}
