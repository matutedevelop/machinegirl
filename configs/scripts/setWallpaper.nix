{pkgs}:
{
  setWallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
    WALLPAPER=$(find "$HOME/Pictures/Wallpapers" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)
    echo "Selected wallpaper: $WALLPAPER" >> /tmp/hyprpaper.log
    pgrep hyprpaper >/dev/null || hyprpaper & sleep .5
    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper ,"$WALLPAPER"
    wal -i "$WALLPAPER" --backend colorthief
    pkill waybar
    waybar
  '';

}
