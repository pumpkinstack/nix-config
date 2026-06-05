{ ... }:
{
  xdg.configFile = {
    "hypr/hyprland.lua".source = ./modules/hyprland.lua;
    "hypr/inputs.lua".source = ./modules/inputs.lua;
    "hypr/autostart.lua".source = ./modules/autostart.lua;
    "hypr/animations.lua".source = ./modules/animations.lua;
    "hypr/binds.lua".source = ./modules/binds.lua;
    "hypr/layout.lua".source = ./modules/layout.lua;
    "hypr/general.lua".source = ./modules/general.lua;
    "hypr/decorations.lua".source = ./modules/decorations.lua;
    "hypr/gestures.lua".source = ./modules/gestures.lua;
    "hypr/window-rules.lua".source = ./modules/window-rules.lua;
  };
}
