{ config, ... }:
{
  xdg.configFile."wallust/templates".source = ./templates;

  xdg.configFile."wallust/wallust.toml".text = ''
    colorscheme = "dark16"
    backend = "full"
    threshold = 20
    check_contrast = true

    [templates.kitty]
    template = "${config.xdg.configHome}/wallust/templates/kitty.conf"
    target = "${config.xdg.configHome}/kitty/colors.conf"

    [templates.waybar]
    template = "${config.xdg.configHome}/wallust/templates/colors.css"
    target = "${config.xdg.configHome}/waybar/colors.css"

    [templates.swaync]
    template = "${config.xdg.configHome}/wallust/templates/swaync.css"
    target = "${config.xdg.configHome}/swaync/colors.css"

    [templates.wlogout]
    template = "${config.xdg.configHome}/wallust/templates/wlogout.css"
    target = "${config.xdg.configHome}/wlogout/colors.css"

    [templates.btop]
    template = "${config.xdg.configHome}/wallust/templates/btop.theme"
    target = "${config.xdg.configHome}/btop/themes/wallust.theme"

    [templates.gtk3]
    template = "${config.xdg.configHome}/wallust/templates/wallust.css"
    target = "${config.xdg.configHome}/gtk-3.0/wallust.css"

    [templates.gtk4]
    template = "${config.xdg.configHome}/wallust/templates/wallust.css"
    target = "${config.xdg.configHome}/gtk-4.0/wallust.css"

    [templates.kvantum]
    template = "${config.xdg.configHome}/wallust/templates/kvantum.kvconfig"
    target = "${config.xdg.configHome}/Kvantum/wallust/wallust.kvconfig"
  '';
}
    # [templates.hyprland]
    # template = "${config.xdg.configHome}/wallust/templates/hyprland.conf"
    # target = "${config.xdg.configHome}/hypr/colors.conf"