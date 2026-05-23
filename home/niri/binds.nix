{ ... }:

{
  programs.niri.settings = {
    binds = {
      "Mod+Return".action.spawn = [ "kitty" ];
      "Mod+Ctrl+Return".action.spawn = [
        "rofi"
        "-show"
        "drun"
      ];
      "Mod+Q".action.close-window = { };
      "Mod+Shift+Q".action.quit = { };
      "Mod+Shift+V".action.spawn = [ "codium" ];
      "Mod+E".action.spawn = [ "nautilus" ];
      "Mod+B".action.spawn = [ "zen-beta" ];
      "Mod+H".action.spawn = [ "heroic" ];
      "Mod+Shift+W".action.spawn = [ "wallpaper-set" ];
      "Mod+Ctrl+W".action.spawn = [ "waypaper" ];

      "Mod+WheelScrollDown".action.focus-workspace-down = { };
      "Mod+WheelScrollUp".action.focus-workspace-up = { };
      "Mod+WheelScrollRight".action.focus-column-right = { };
      "Mod+WheelScrollLeft".action.focus-column-left = { };

      "Mod+V".action.spawn-sh = "cliphist list | wofi -dmenu | cliphist decode | wl-copy";

      # Workspace
      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;
      "Mod+0".action.focus-workspace = 10;

      "XF86AudioRaiseVolume".action.spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "5+"
      ];
      "XF86AudioLowerVolume".action.spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "5-"
      ];

      "XF86MonBrightnessUp".action.spawn = [
        "brightnessctl"
        "set"
        "2+"
      ];
      "XF86MonBrightnessDown".action.spawn = [
        "brightnessctl"
        "set"
        "2-"
      ];
    };
  };
}
