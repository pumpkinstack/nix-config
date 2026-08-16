{ config, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      window_padding_width = 8;
      background_opacity = 0.95;
      background_blur = 1;
      confirm_os_window_close = 0;
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
      auto_reload_config = 0.2;
      # Font
      font_family = "GoMono Nerd Font";
      font_size = 12;
      # Performance
      sync_to_monitor = true;
      repaint_delay = 8;
      input_delay = 1;
      # Layout
      enabled_layouts = "tall, stack";
      # Audio
      enable_audio_bell = false;
    };
    keybindings = {
      # Tabs
      "ctrl+shift+t"       = "new_tab_with_cwd";
      "ctrl+shift+w"       = "close_tab";
      "ctrl+shift+right"   = "next_tab";
      "ctrl+shift+left"    = "previous_tab";
      "ctrl+shift+,"       = "move_tab_backward";
      "ctrl+shift+."       = "move_tab_forward";

      # Windows (tall layout — side by side)
      "ctrl+shift+enter"   = "new_window_with_cwd";
      "ctrl+shift+q"       = "close_window";
      "ctrl+shift+l"       = "next_window";
      "ctrl+shift+h"       = "previous_window";
      "ctrl+shift+r"       = "start_resizing_window";
      "ctrl+shift+f"       = "toggle_layout stack";
    };
    extraConfig = ''
      include ${config.xdg.configHome}/kitty/kitty-colors.conf
      shell zsh -c "fastfetch; exec zsh"
    '';
  };
}