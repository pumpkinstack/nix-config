{ config, ... }:
{
  sops.secrets.nextdns_servers = {
    sopsFile = ../../secrets/secrets.yaml;
    restartUnits = [ "systemd-resolved.service" ];
  };

  sops.templates."nextdns.conf" = {
    content = ''
      [Resolve]
      DNS=${config.sops.placeholder.nextdns_servers}
      DNSSEC=true
      DNSOverTLS=true
      MulticastDNS=no
      LLMNR=no
    '';
    path = "/etc/systemd/resolved.conf.d/nextdns.conf";
    owner = "systemd-resolve";
    mode = "0440";
  };

  networking = {
    hostName = "leyndell";
    networkmanager.enable = true;
    networkmanager.dns = "systemd-resolved";
    networkmanager.settings = {
      main.dns = "systemd-resolved";
      connection = {
        "ipv4.ignore-auto-dns" = true;
        "ipv6.ignore-auto-dns" = true;
      };
    };
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
  };
}
