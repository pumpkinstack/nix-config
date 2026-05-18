{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {

    decoration = {
      rounding = 10;
      blur = {
        enabled = true;
        size = 8;
        passes = 2;
        new_optimizations = true;
        xray = false;
        active_opacity = 1.0;
        inactive_opacity = 0.92;
      };
      shadow = {
        enabled = true;
        range = 20;
        render_power = 3;
        color = "rgba(00000088)";
      };
    };
  };
}
