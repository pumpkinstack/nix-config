{ pkgs, ... }:

let
  raidenTheme = pkgs.fetchFromGitHub {
    owner = "Dan1meR4ik-12";
    repo = "RaidenShogun-GRUB-Theme";
    rev = "440e8d056d71c71f1c83b5bd8b7d9a6655e0a678";
    hash = "sha256-0kxnJUIExNIi+YesIfrArrTuCYSV4H6vB8jJHu6LoXk=";
  } + "/RaidenShogun_en";

in
{
  boot = {
    kernelParams = [ "quiet" "pcie_aspm=off" ];
    kernelPackages = pkgs.linuxPackages_latest;
    blacklistedKernelModules = [ "uvcvideo" ];
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        theme = raidenTheme;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}