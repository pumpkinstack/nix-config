{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      profile = "gpu-hq";
      hwdec = "auto-safe";
      vo = "gpu-next";
      save-position-on-quit = true; # resume where you left off
      sub-auto = "fuzzy"; # auto-load matching subtitles
      keep-open = true; # don't close at end of file
    };
    scripts = with pkgs.mpvScripts; [
      uosc
      thumbfast
      mpris
      autoload # queue other files in the same folder
    ];
  };
}
