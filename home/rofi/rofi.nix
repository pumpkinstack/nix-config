{ pkgs, ... }:

{
  home.packages = [ pkgs.rofimoji ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    terminal = "${pkgs.kitty}/bin/kitty";

    extraConfig = {
      modi = "drun,run,window,emoji:rofimoji";
      icon-theme = "candy-icons";
      show-icons = true;
      drun-display-format = "{name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps";
      display-run = "   Run";
      display-window = "   Windows";
      display-emoji = "󰱫  Emoji";
      sidebar-mode = true;
    };

    theme = builtins.toFile "matugen.rasi" ''
      @import "colors.rasi"

      * {
        font:             "Noto Serif 12";
        background-color: transparent;
        text-color:       @on-surface;
        margin:           0px;
        padding:          0px;
        spacing:          0px;
      }

      window {
        background-color: @surface;
        border:           2px solid;
        border-color:     @outline-variant;
        border-radius:    12px;
        width:            560px;
        padding:          0px;
      }

      mainbox {
        background-color: transparent;
        children:         [ inputbar, message, listview, mode-switcher ];
        spacing:          0px;
        padding:          10px;
      }

      inputbar {
        background-color: @surface-container;
        border-radius:    8px;
        padding:          10px 14px;
        spacing:          10px;
        children:         [ prompt, entry ];
        margin:           0px 0px 8px 0px;
      }

      prompt {
        background-color: transparent;
        text-color:       @primary;
        font:             "Noto Serif Bold 12";
      }

      entry {
        background-color: transparent;
        text-color:       @on-surface;
        placeholder-color: @on-surface-variant;
        placeholder:      "Search...";
      }

      listview {
        background-color: transparent;
        columns:          1;
        lines:            8;
        scrollbar:        false;
        spacing:          4px;
        padding:          4px 0px;
      }

      element {
        background-color: transparent;
        border-radius:    8px;
        padding:          8px 12px;
        spacing:          10px;
        children:         [ element-icon, element-text ];
        orientation:      horizontal;
      }

      element normal.normal {
        background-color: transparent;
        text-color:       @on-surface;
      }

      element selected.normal {
        background-color: @primary-container;
        text-color:       @on-primary-container;
      }

      element active.normal {
        background-color: @secondary-container;
        text-color:       @on-secondary-container;
      }

      element urgent.normal {
        background-color: @error-container;
        text-color:       @on-error-container;
      }

      element-icon {
        background-color: transparent;
        size:             24px;
      }

      element-text {
        background-color: transparent;
        text-color:       inherit;
        vertical-align:   0.5;
      }

      mode-switcher {
        background-color: @surface-container;
        border-radius:    8px;
        spacing:          6px;
        padding:          6px;
        margin:           8px 0px 0px 0px;
      }

      button {
        background-color: transparent;
        text-color:       @on-surface-variant;
        border-radius:    6px;
        padding:          4px 12px;
      }

      button selected {
        background-color: @secondary-container;
        text-color:       @on-secondary-container;
      }

      message {
        background-color: @surface-container-high;
        border-radius:    8px;
        margin:           0px 0px 8px 0px;
        padding:          8px 12px;
      }

      textbox {
        background-color: transparent;
        text-color:       @on-surface;
      }
    '';
  };
}