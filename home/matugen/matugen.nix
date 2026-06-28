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
    input_path = "${./templates/hyprland-colors.lua}"
    output_path = "${config.xdg.configHome}/hypr/hyprland-colors.lua"

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

    [templates.swaync]
    input_path = "${./templates/swaync-colors.css}"
    output_path = "${config.xdg.configHome}/swaync/colors.css"

    [templates.neovim]
    input_path = "${./templates/neovim-colors.lua}"
    output_path = "~/.local/share/nvim/site/lua/matugen_colors.lua"

    [templates.heroic]
    input_path =  "${./templates/heroic.css}"
    output_path = "${config.xdg.configHome}/heroic/themes/heroic.css"

    [templates.ayugram]
    input_path = "${./templates/telegram.tdesktop-theme}"
    output_path = "${config.xdg.configHome}/ayugram/themes/matugen.tdesktop-theme"

    [templates.rofi]
    input_path = "${./templates/colors.rasi}"
    output_path = "${config.xdg.configHome}/rofi/colors.rasi"

    [templates.discord-material]
    input_path = "${./templates/discord-material.css}"
    output_path = "${config.xdg.configHome}/Equicord/themes/discord-material.css"

    [templates.discord-midnight]
    input_path = "${./templates/discord-midnight.css}"
    output_path = "${config.xdg.configHome}/Equicord/themes/discord-midnight.css"

    [templates.youtube-music]
    input_path = "${./templates/youtube-music.css}"
    output_path = "${config.xdg.configHome}/youtube-music/theme.css"
  '';
}
