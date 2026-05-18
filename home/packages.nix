{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Hyprland/Wayland Desktop Environment
    wallust
    matugen
    awww
    hyprpicker
    wl-clipboard
    cliphist
    swaynotificationcenter
    wlogout
    hyprshot
    waypaper
    wofi

    # Multimedia & Graphics
    vlc
    imv
    imagemagick
    obs-studio
    upscayl
    pear-desktop
    playerctl
    pavucontrol

    # Gaming
    heroic

    nautilus
    libreoffice
    zathura
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    proton-vpn
    anydesk

    # System Utilities & CLI Tools
    fzf
    cabextract
    qbittorrent
    glib
    gsettings-desktop-schemas

    # misc2
    instaloader
    ffmpeg
  ];
}
