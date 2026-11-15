{ pkgs, ... }:

{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
        dwproton-bin
      ];
    };
    gamemode.enable = true;
  };
}
