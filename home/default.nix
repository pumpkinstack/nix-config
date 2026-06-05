{ inputs, pkgs, lib, ... }:

{
  imports = [
    ./shell.nix
    ./packages.nix
    ./xdg.nix
    ./btop/btop.nix
    ./fastfetch/fastfetch.nix
    ./gallerydl/gallerydl.nix
    ./gtk/gtk.nix
    ./kitty/kitty.nix
    ./matugen/matugen.nix
    ./wallpaper_changer/wallpaper.nix
    ./wallust/wallust.nix
    ./waybar/waybar.nix
    ./rofi/rofi.nix
    ./swaync/swaync.nix
    ./wlogout/wlogout.nix
    ./mpvpaper/mpvpaper.nix
    ./browser/zen.nix
    ./xdg.nix
    ./editors/vscodium.nix
    ./hyprland/default.nix
    ./niri/niri.nix
    ./quickshell/quickshell.nix
    ./nixcord/nixcord.nix
  ];

  home.username = "ashenone";
  home.homeDirectory = "/home/ashenone";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    QML_IMPORT_PATH = lib.concatStringsSep ":" [
      "${pkgs.qt6.qtdeclarative}/lib/qml"
      "${inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default}/lib/qml"
    ];
  };

  programs.home-manager.enable = true;
}
