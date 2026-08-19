{ pkgs, ... }:
let
  wallpaperScript = pkgs.writeShellScriptBin "wallpaper-set" ''
        WALLS="$HOME/Pictures/walls"
        WALL=$(find "$WALLS" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" -o -name "*.webp" \) | shuf -n 1)
        awww img "$WALL" --transition-type wipe --transition-duration 1.5 --resize fit
        colorice "$WALL" -a -m vibrant --min-contrast 4.5 -c 16 --segment
        pkill -USR2 waybar
        pkill -USR2 btop
    		pkill -USR1 nvim
  '';
in
{
  home.packages = [ wallpaperScript ];
}
#  matugen image "$WALL" --source-color-index 0
# wallust run "$WALL"
# colorice "$WALL" -a -m vibrant --min-contrast 4.5 -c 16 --segment
