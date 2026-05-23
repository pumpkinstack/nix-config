{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome   # niri-flake recommends this for screencasting
    ];
    config = {
      hyprland = {
        default = [ "hyprland" "gtk" ];
      };
      niri = {
        default = [ "gnome" "gtk" ];
      };
      common = {
        default = [ "gtk" ];
      };
    };
  };
}