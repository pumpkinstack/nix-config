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
        # "94.140.14.14#dns.adguard-dns.com"
        # "2a10:50c0::ad1:ff#dns.adguard-dns.com"
        "2a07:a8c0::66:ce99#66ce99.dns.nextdns.io"
        "45.90.28.0#66ce99.dns.nextdns.io"
      ];
      DNSSEC = true;
      DNSOverTLS = true;
      MulticastDNS = false;
      LLMNR = false;
    };
  };
}
