# { config, lib, pkgs, ... }:

# let
#   sddm-theme = pkgs.stdenv.mkDerivation {
#     name = "sddm-bloodstained-theme";
#     src = pkgs.fetchFromGitHub {
#       owner = "BloodstainedOath";
#       repo = "sddm-theme";
#       rev = "main";
#       sha256 = "0n81ki7ch8xjab34x50985hdrr6gapl60027y9hxaap4shdv1c7c";
#     };
#     installPhase = ''
#       mkdir -p $out/share/sddm/themes/bloodstained
#       cp -r . $out/share/sddm/themes/bloodstained
#     '';
#   };
# in
# {
#   services.displayManager.sddm = {
#     enable = true;
#     wayland.enable = true;
#     theme = "bloodstained";
#   };

#   environment.systemPackages = [ sddm-theme ];
# }

{
  pkgs,
  ...
}:

let
  sddm-theme = pkgs.stdenv.mkDerivation {
    name = "sddm-theme-genshin";
    src = pkgs.fetchFromGitHub {
      owner = "Darkkal44";
      repo = "qylock";
      rev = "bece4d25a9dcd043a072847c8ed92dca3800616e";
      hash = "sha256-u1+0dkL4gYyIQP/Ap2cGyf6WhQbUNHxDQDkxT/gbZ1Q=";
    };

    installPhase = ''
      mkdir -p $out/share/sddm/themes/Genshin
      cp -r themes/Genshin/. $out/share/sddm/themes/Genshin
    '';
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "Genshin";
    package = pkgs.kdePackages.sddm; # Qt6-based SDDM

    extraPackages = with pkgs; [
      sddm-theme
      kdePackages.qtdeclarative
      kdePackages.qt5compat
      kdePackages.qtmultimedia
    ];
  };

  environment.systemPackages = with pkgs; [
    sddm-theme
  ];
}