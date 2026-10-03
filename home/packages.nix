{
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    # Hyprland / Wayland Desktop Environment
    wallust
    matugen
    colorice
    awww
    hyprpicker
    wl-clipboard
    cliphist
    swaynotificationcenter
    wlogout
    hyprshot
    waypaper

    # Multimedia & Graphics
    vlc
    obs-studio
    upscayl
    pavucontrol
    pear-desktop

    # Gaming
    heroic
    inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default

    # File Management & Viewers
    nautilus
    zathura
    loupe

    # Qt/GTK Theming
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    gsettings-desktop-schemas
    glib

    # Productivity & Communication
    libreoffice
    gnome-text-editor
    obsidian
    signal-desktop
    karere
    proton-vpn
    vivaldi
    vivaldi-ffmpeg-codecs

    # System Utilities & CLI Tools
    fzf
    cabextract
    qbittorrent
    yt-dlp
    imagemagick
    playerctl
    instaloader
    ffmpeg
  ];
}
