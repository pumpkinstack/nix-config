{ inputs, pkgs, ... }:
{
  home.packages = [
    (inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default.withModules [
      pkgs.qt6.qt5compat
      pkgs.qt6.qtpositioning
      pkgs.qt6.qtmultimedia
      pkgs.qt6.qtimageformats
      pkgs.qt6.qtsvg
      pkgs.kdePackages.syntax-highlighting
    ])
  ];
  home.file.".config/quickshell" = {
    source = ./config;
    recursive = true;
  };
}
