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
        mpv = [ "umpv.desktop" ];
        zathura = [ "org.pwmt.zathura.desktop" ];
        codium = [ "codium.desktop" ];
        loupe = [ "org.gnome.Loupe.desktop" ];
        gnome-editor = [ "org.gnome.TextEditor.desktop" ];

        videoTypes = [
          "video/x-matroska"
          "video/quicktime"
          "video/mp4"
          "video/webm"
          "video/x-msvideo"
          "video/mpeg"
          "video/ogg"
        ];

        audioTypes = [
          "audio/mpeg"
          "audio/flac"
          "audio/ogg"
          "audio/x-wav"
          "audio/mp4"
          "audio/x-opus+ogg"
        ];

        mediaAssociations = builtins.listToAttrs (
          map (t: {
            name = t;
            value = mpv;
          }) (videoTypes ++ audioTypes)
        );

        associations = mediaAssociations // {
          "inode/directory" = nautilus;
          "application/pdf" = zathura;
          "image/png" = loupe;
          "image/jpeg" = loupe;
          "image/webp" = loupe;
          "application/x-tar" = nautilus;
          "application/zip" = nautilus;
          "application/json" = codium;
          "text/x-python" = codium;
          "text/css" = codium;
          "text/plain" = gnome-editor;
          "text/x-csrc" = codium;
        };
      in
      {
        enable = true;
        associations.added = associations;
        defaultApplications = associations;
      };
  };
}
