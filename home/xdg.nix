{ config, ... }:

{
  xdg = {
    enable = true;

    userDirs =
      let
        home = config.home.homeDirectory;
      in
      {
        enable = true;
        createDirectories = true;
        setSessionVariables = true;

        desktop = null;
        documents = "${home}/Documents";
        download = "${home}/Downloads";
        pictures = "${home}/Pictures";
        music = "${home}/Music";
        videos = "${home}/Videos";

        publicShare = null;
        templates = null;
      };

    mimeApps =
      let
        nautilus = [ "org.gnome.Nautilus.desktop" ];
        vlc = [ "vlc.desktop" ];
        zathura = [ "org.pwmt.zathura.desktop" ];
        codium = [ "codium.desktop" ];
        loupe = [ "org.gnome.Loupe.desktop" ];
        gnome-editor = [ "org.gnome.TextEditor.desktop" ];

        associations = {
          "inode/directory" = nautilus;
          "application/pdf" = zathura;
          "video/x-matroska" = vlc;
          "video/quicktime" = vlc;
          "video/mp4" = vlc;
          "audio/mpeg" = vlc;
          "image/png" = loupe;
          "image/jpeg" = loupe;
          "image/webp" = loupe;
          "application/x-tar" = nautilus;
          "application/zip" = nautilus;
          "application/json" = codium;
          "text/x-python" = codium;
          "text/css" = codium;
          "text/plain" = gnome-editor;
          "text/x-csrc" =codium;
        };
      in
      {
        enable = true;
        associations.added = associations;
        defaultApplications = associations;
      };
  };
}
