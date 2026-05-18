{
  pkgs,
  ...
}:

let
  grubsouls = pkgs.fetchFromGitHub {
    owner = "PedroMMarinho";
    repo = "grubsouls-theme";
    rev = "main";
    sha256 = "0ih5gkw68vdms3rxv42wwm4jmjpf2c7yq2m3nzp11w9dxn14lxy3";
  };

  background = "[41] Pontiff Sulyvahn.png";

  grubsoulsTheme = pkgs.runCommand "grubsouls-themed" { } ''
    cp -r ${grubsouls}/grubsouls $out
    chmod -R +w $out
    cp "${grubsouls}/background_galery/${background}" $out/background.png
  '';
in
{
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = false;
    theme = "${grubsoulsTheme}";
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.blacklistedKernelModules = [ "uvcvideo" ];
}
