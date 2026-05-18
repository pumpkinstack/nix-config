{
  pkgs,
  ...
}:

{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
      # package = pkgs.steam.override {
      #   extraPkgs =
      #     pkgs: with pkgs; [
      #       libXcursor
      #       libXi
      #       libXinerama
      #       libXScrnSaver
      #       libpng
      #       libpulseaudio
      #       libvorbis
      #       stdenv.cc.cc.lib
      #       libkrb5
      #       keyutils
      #     ];
      # };
    };
    gamemode = {
      enable = true;
    };
  };
}
