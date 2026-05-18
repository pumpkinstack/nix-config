{ config, pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./packages.nix
    ./quickshell.nix
    ./btop/btop.nix
    ./fastfetch/fastfetch.nix
    ./hyprland/hyprland.nix
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
  ];

  home.username = "tarnished";
  home.homeDirectory = "/home/tarnished";
  home.stateVersion = "25.11";

  wayland.windowManager.hyprland.systemd.enable = false;
  programs.home-manager.enable = true;
}
