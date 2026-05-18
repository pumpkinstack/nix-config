{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    terminal = "${pkgs.kitty}/bin/kitty";
    location = "center";
    extraConfig = {
      modi = "drun,run,filebrowser";
      show-icons = true;
      icon-theme = "Papirus";
      drun-display-format = "{name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps";
      display-run = "   Run";
      display-filebrowser = "   Files";
    };
    theme = ./rofi-theme.rasi;
  };
}
