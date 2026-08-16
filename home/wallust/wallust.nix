{ config, ... }:
{
  xdg.configFile."wallust/wallust.toml".text = ''
            colorscheme = "dark16"
            backend = "full"
        	  check_contrast = true
    				threshold = 20

            [templates.kitty]
            template = "${./templates/kitty-colors.conf}"
            target = "${config.xdg.configHome}/kitty/kitty-colors.conf"

            [templates.waybar]
            template = "${./templates/waybar-colors.css}"
            target = "${config.xdg.configHome}/waybar/waybar-colors.css"

            [templates.swaync]
            template = "${./templates/swaync-colors.css}"
            target = "${config.xdg.configHome}/swaync/colors.css"

            [templates.wlogout]
            template = "${./templates/colors.css}"
            target = "${config.xdg.configHome}/wlogout/colors.css"

            [templates.btop]
            template = "${./templates/dynamic-btop.theme}"
            target = "${config.xdg.configHome}/btop/themes/dynamic-btop.theme"

            [templates.gtk3]
            template = "${./templates/gtk3-colors.css}"
            target = "${config.xdg.configHome}/gtk-3.0/gtk3-colors.css"

            [templates.gtk4]
            template = "${./templates/gtk4-colors.css}"
            target = "${config.xdg.configHome}/gtk-4.0/gtk4-colors.css"

            [templates.qt5]
            template = "${./templates/qtct.conf}"
            target = "${config.xdg.configHome}/qt5ct/colors/qtct.conf"

            [templates.qt6]
            template = "${./templates/qtct.conf}"
            target = "${config.xdg.configHome}/qt6ct/colors/qtct.conf"

            [templates.hyprland]
            template = "${./templates/hyprland-colors.lua}"
            target = "${config.xdg.configHome}/hypr/hyprland-colors.lua"

            [templates.vscode]
            template = "${./templates/code.json}"
            target= "${config.home.homeDirectory}/.vscode-oss/extensions/noctalia.noctaliatheme-0.0.5-universal/themes/NoctaliaTheme-color-theme.json"

            [templates.neovim]
            template = "${./templates/neovim-colors.json}"
            target = "${config.xdg.configHome}/matugen/colors.json"

            [templates.heroic]
            template =  "${./templates/heroic.css}"
            target = "${config.xdg.configHome}/heroic/themes/heroic.css"

            [templates.rofi]
            template = "${./templates/colors.rasi}"
            target = "${config.xdg.configHome}/rofi/colors.rasi"

            [templates.discord-material]
            template = "${./templates/discord-material.css}"
            target = "${config.xdg.configHome}/Equicord/themes/discord-material.css"

            [templates.discord-midnight]
            template = "${./templates/discord-midnight.css}"
            target = "${config.xdg.configHome}/Equicord/themes/discord-midnight.css"

            [templates.zen-chrome]
            template  =  "${./templates/zen-userChrome.css}"
            target = "${config.xdg.configHome}/zen/zenix/chrome/userChrome.css"

            [templates.zen-content]
            template  =  "${./templates/zen-userContent.css}"
            target = "${config.xdg.configHome}/zen/zenix/chrome/userContent.css"
  '';
}
