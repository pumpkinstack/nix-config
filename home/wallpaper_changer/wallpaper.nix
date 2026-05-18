{ pkgs, ... }:
let
  wallpaperScript = pkgs.writeShellScriptBin "wallpaper-set" ''
    WALLS="$HOME/Pictures/walls"
    WALL=$(ls "$WALLS" | shuf -n 1)
    awww img "$WALLS/$WALL" --transition-type wipe --transition-duration 1.5 --resize fit
    matugen -v  image "$WALLS/$WALL"  --source-color-index 0
    pkill -USR2 waybar
    pkill -USR2 btop
    kill -SIGUSR1 $(pidof kitty)
  '';
in
{
  home.packages = [ wallpaperScript ];
}
