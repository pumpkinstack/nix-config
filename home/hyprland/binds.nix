{  ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$fileManager" = "nautilus";
    "$browser" = "zen-beta";
    "$codeEditor" = "codium";
    "$terminal" = "kitty";

    bind = [
      # Window Management
      "$mod, Q, killactive"
      "$mod, M, exit"
      "$mod, F, fullscreen"
      "$mod SHIFT, F, togglefloating"

      # Applications and Services
      "$mod, Return, exec, $terminal"
      "$mod CTRL, Return, exec, rofi -show drun"
      "$mod, E, exec, $fileManager"
      "$mod SHIFT, V, exec, $codeEditor"
      "$mod, B, exec, $browser"
      "$mod SHIFT, W, exec, wallpaper-set"
      "$mod, H, exec, heroic"
      "$mod, U, exec, upscayl"
      "$mod, Y, exec, pear-desktop"
      "$mod CTRL, W, exec, waypaper"

      # Focus
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # Move windows
      "$mod SHIFT, left, movewindow, l"
      "$mod SHIFT, right, movewindow, r"
      "$mod SHIFT, up, movewindow, u"
      "$mod SHIFT, down, movewindow, d"

      # Scrolling layout - move columns
      "$mod, period, layoutmsg, move +col"
      "$mod, comma, layoutmsg, move -col"

      # Scrolling layout - swap columns
      "$mod SHIFT, period, layoutmsg, swapcol r"
      "$mod SHIFT, comma, layoutmsg, swapcol l"

      # Scrolling layout - fit
      "$mod, A, layoutmsg, fit active"
      "$mod SHIFT, A, layoutmsg, fit visible"

      # Cycle preconfigured column widths
      "$mod, W, layoutmsg, colresize +conf"
      "$mod ALT, W, layoutmsg, colresize -conf"

      # Workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"

      # Scroll through workspaces
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"

      # Screenshot
      ", Print, exec, hyprshot -m output"
      "$mod, Print, exec, hyprshot -m window"
      "$mod SHIFT, Print, exec, hyprshot -m region"

      # Volume
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

      "$mod, V, exec, sh -c 'cliphist list | wofi -dmenu | cliphist decode | wl-copy'"
    ];

    binde = [
      # Volume (hold to repeat)
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 2.0 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

      # Brightness (hold to repeat)
      ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

      # Column resize (hold to repeat)
      "$mod ALT, right, layoutmsg, colresize +0.05"
      "$mod ALT, left, layoutmsg, colresize -0.05"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
