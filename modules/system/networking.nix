{ lib, ... }:

let
  nextdnsId = lib.strings.trim (builtins.readFile /home/ashenone/nix-config/.secrets/nextdns-id);
in
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
        "2a07:a8c0::66:ce99#${nextdnsId}.dns.nextdns.io"
        "45.90.28.0#${nextdnsId}.dns.nextdns.io"
      ];
      DNSSEC = true;
      DNSOverTLS = true;
      MulticastDNS = false;
      LLMNR = false;
    };
  };
}