{  ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "matugen-btop";
      theme_background = false;
      truecolor = true;
      force_tty = false;
      presets = "cpu:0:default,mem:0:default,net:0:default,proc:0:default";
      graph_symbol = "braille";
      update_ms = 1500;
    };
  };
}
