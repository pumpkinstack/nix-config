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
        vscode = [ "code.desktop" ];
        imv = [ "imv-dir.desktop" ];

        associations = {
          "inode/directory" = nautilus;

          "application/pdf" = zathura;

          "video/x-matroska" = vlc;
          "video/quicktime" = vlc;
          "video/mp4" = vlc;

          "audio/mpeg" = vlc;

          "image/png" = imv;
          "image/jpeg" = imv;
          "image/webp" = imv;

          "application/x-tar" = nautilus;
          "application/zip" = nautilus;

          "application/json" = vscode;
          "text/x-python" = vscode;
          "text/css" = vscode;
          "text/plain" = vscode;
        };
      in
      {
        enable = true;
        associations.added = associations;
        defaultApplications = associations;
      };
  };
}
