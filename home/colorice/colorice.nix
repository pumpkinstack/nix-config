{ config, ... }:
{
  xdg.configFile."colorice/templates".source = ./templates;
  xdg.configFile."colorice/config.toml".text = ''
    [[templates]]
    name = "kitty"
    input = "kitty-colors.conf"
    output = "${config.xdg.configHome}/kitty/kitty-colors.conf"
    hook = "killall -USR1 kitty"

    [[templates]]
    name = "hyprland"
    input = "hyprland-colors.lua"
    output = "${config.xdg.configHome}/hypr/colorice-colors.lua"

    [[templates]]
    name = "waybar"
    input = "waybar-colors.css"
    output = "${config.xdg.configHome}/waybar/waybar-colors.css"

    [[templates]]
    name = "swaync"
    input = "swaync-colors.css"
    output = "${config.xdg.configHome}/swaync/colors.css"

    [[templates]]
    name = "wlogout"
    input = "colors.css"
    output = "${config.xdg.configHome}/wlogout/colors.css"

    [[templates]]
    name = "btop"
    input = "matugen-btop.theme"
    output = "${config.xdg.configHome}/btop/themes/dynamic-btop.theme"

    [[templates]]
    name = "gtk3"
    input = "gtk3-colors.css"
    output = "${config.xdg.configHome}/gtk-3.0/gtk3-colors.css"

    [[templates]]
    name = "gtk4"
    input = "gtk4-colors.css"
    output = "${config.xdg.configHome}/gtk-4.0/gtk4-colors.css"

    [[templates]]
    name = "qt5"
    input = "qtct.conf"
    output = "${config.xdg.configHome}/qt5ct/colors/qtct.conf"

    [[templates]]
    name = "qt6"
    input = "qtct.conf"
    output = "${config.xdg.configHome}/qt6ct/colors/qtct.conf"

    [[templates]]
    name = "vscode"
    input = "code.json"
    output = "${config.home.homeDirectory}/.vscode-oss/extensions/noctalia.noctaliatheme-0.0.5-universal/themes/NoctaliaTheme-color-theme.json"

    [[templates]]
    name = "neovim"
    input = "neovim-colors.json"
    output = "${config.xdg.configHome}/matugen/colors.json"

    [[templates]]
    name = "heroic"
    input = "heroic.css"
    output = "${config.xdg.configHome}/heroic/themes/heroic.css"

    [[templates]]
    name = "rofi"
    input = "colors.rasi"
    output = "${config.xdg.configHome}/rofi/colors.rasi"

    [[templates]]
    name = "discord-material"
    input = "discord-material.css"
    output = "${config.xdg.configHome}/Equicord/themes/discord-material.css"

    [[templates]]
    name = "discord-midnight"
    input = "discord-midnight.css"
    output = "${config.xdg.configHome}/Equicord/themes/discord-midnight.css"

    [[templates]]
    name = "zen-chrome"
    input  =  "zen-userChrome.css"
    output = "${config.xdg.configHome}/zen/zenix/chrome/userChrome.css"

    [[templates]]
    name = "zen-content"
    input  =  "zen-userContent.css"
    output = "${config.xdg.configHome}/zen/zenix/chrome/userContent.css"
  '';
}
