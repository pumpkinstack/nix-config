{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./animations.nix
    ./binds.nix
    ./window-rules.nix
    ./layout.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    settings = {

      monitor = ",1920x1080@144,auto,1";

      source = "$HOME/.config/hypr/hypr.conf";

      exec-once = [
        "waybar"
        "awww-daemon"
        "awww restore"
        " wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      env = [
        "XCURSOR_THEME, Bibata-Modern-Ice"
        "XCURSOR_SIZE, 24"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          tap-to-click = true;
        };
        sensitivity = 0;
      };
    };
  };
}
