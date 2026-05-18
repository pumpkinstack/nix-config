{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      window_padding_width = 8;
      background_opacity = "0.95";
      confirm_os_window_close = 0;
      cursor_trail = "3";
      cursor_trail_decay = " 0.1 0.4 ";
      # Font
      font_family = "GoMono Nerd Font";
      font_size = 12;
      # Performance
      sync_to_monitor = true;
      repaint_delay = 8;
      input_delay = 1;
    };
    extraConfig = ''
      include ${config.xdg.configHome}/kitty/kitty-colors.conf
      shell zsh -c "fastfetch; exec zsh"
    '';
  };
}
