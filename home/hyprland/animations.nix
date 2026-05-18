{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
      bezier = [
        "ritual, 0.76, 0, 0.24, 1" # slow start, slow end — very heavy
        "emergence, 0.87, 0, 0.13, 1" # sharp snap in
        "fade, 0.4, 0, 0.6, 1" # smooth fade
      ];
      animation = [
        "windows, 1, 6, emergence, popin 60%" # windows emerge from nothing
        "windowsOut, 1, 8, ritual, popin 80%" # slow dramatic death
        "fade, 1, 6, fade" # eerie fade in/out
        "fadeOut, 1, 8, fade" # slow fade to black
        "workspaces, 1, 7, ritual, slide" # heavy workspace slide
        "specialWorkspace, 1, 8, ritual, slidevert" # rises from below
      ];
    };
  };
}
