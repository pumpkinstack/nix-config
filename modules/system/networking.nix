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
        "1.1.1.1#cloudflare-dns.com"
        "9.9.9.9#dns.quad9.net"
      ];
      DNSSEC = true;
      DNSOverTLS = true;
      MulticastDNS = false;
      LLMNR = false;
    };
  };
}
