{
  config,
  pkgs,
  ...
}:
{
  gtk = {
    enable = true;
    colorScheme = "dark";
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "candy-icons";
      package = pkgs.candy-icons;
    };
    font = {
      name = "Noto Serif";
      size = 12;
    };
    gtk3 = {
      enable = true;
      extraCss = "@import 'gtk3-colors.css';";
    };
    gtk4 = {
      enable = true;
      theme = null;
      extraCss = "@import 'gtk4-colors.css';";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  dconf.settings = {
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      show-hidden-files = true;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Bibata-Modern-Ice";
      cursor-size = 24;
      font-name = "Noto Serif 12";
      monospace-font-name = "GoMono Nerd Font 12";
      gtk-theme = "adw-gtk3-dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style.name = "qt5ct";
  };
  xdg.configFile."qt5ct/qt5ct.conf".text = ''
    [Appearance]
    color_scheme_path=${config.home.homeDirectory}/.config/qt5ct/colors/qtct.conf
    custom_palette=true
    style=Fusion
  '';

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    color_scheme_path=${config.home.homeDirectory}/.config/qt6ct/colors/qtct.conf
    custom_palette=true
    style=Fusion
  '';

  home.file.".config/gtk-3.0/bookmarks".text = ''
    file://${config.home.homeDirectory}/Documents Documents
    file://${config.home.homeDirectory}/Downloads Downloads
    file://${config.home.homeDirectory}/Pictures Pictures
    file://${config.home.homeDirectory}/Videos Videos
    file://${config.home.homeDirectory}/Music Music
  '';
  # qt = {
  #   enable = true;
  #   style.name = "kvantum";
  #   platformTheme.name = "kvantum";

  #   kvantum = {
  #     enable = true;
  #     settings = {
  #       General = {
  #         theme = "wallust";
  #       };
  #     };
  #   };
  # };
}
