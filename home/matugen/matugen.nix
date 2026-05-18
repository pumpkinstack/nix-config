{ config, ... }:
{

  xdg.configFile."matugen/config.toml".text = ''
    [config]
    mode = "dark"
    type = "scheme-fidelity"
    reload_apps = true
    resize_filter = "lanczos3"

    [templates.gtk3]
    input_path = "${./templates/gtk3-colors.css}"
    output_path = "${config.xdg.configHome}/gtk-3.0/gtk3-colors.css"

    [templates.gtk4]
    input_path = "${./templates/gtk4-colors.css}"
    output_path = "${config.xdg.configHome}/gtk-4.0/gtk4-colors.css"

    [templates.kitty]
    input_path = "${./templates/kitty-colors.conf}"
    output_path = "${config.xdg.configHome}/kitty/kitty-colors.conf"

    [templates.hyprland]
    input_path = "${./templates/hypr.conf}"
    output_path = "${config.xdg.configHome}/hypr/hypr.conf"

    [templates.waybar]
    input_path = "${./templates/waybar-colors.css}"
    output_path = "${config.xdg.configHome}/waybar/waybar-colors.css"

    [templates.btop]
    input_path = "${./templates/matugen-btop.theme}"
    output_path = "${config.xdg.configHome}/btop/themes/matugen-btop.theme"

    [templates.zen-chrome]
    input_path  =  "${./templates/zen-userChrome.css}"
    output_path = "${config.xdg.configHome}/zen/zenix/chrome/userChrome.css"

    [templates.zen-content]
    input_path  =  "${./templates/zen-userContent.css}"
    output_path = "${config.xdg.configHome}/zen/zenix/chrome/userContent.css"

    [templates.qt-colors]
    input_path  =  "${./templates/qtct.conf}"
    output_path = "${config.xdg.configHome}/qt5ct/colors/qtct.conf"

    [templates.qt6ct]
    input_path  =   "${./templates/qtct.conf}"
    output_path = "${config.xdg.configHome}/qt6ct/colors/qtct.conf"

    [templates.vscode]
    input_path = "${./templates/code.json}"
    output_path = "${config.home.homeDirectory}/.vscode-oss/extensions/noctalia.noctaliatheme-0.0.5-universal/themes/NoctaliaTheme-color-theme.json"

    [templates.wlogout]
    input_path = "${./templates/colors.css}"
    output_path = "${config.xdg.configHome}/wlogout/colors.css"
  '';
}
