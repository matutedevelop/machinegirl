{ pkgs }:
#
# pkgs.writeShellScriptBin "set-wallpaper" ''
#     WALLPAPER=$(find "$HOME/Pictures/Wallpapers" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)
#     echo "Selected wallpaper: $WALLPAPER" >> /tmp/hyprpaper.log
#     pgrep hyprpaper >/dev/null || hyprpaper & sleep .5
#     hyprctl hyprpaper preload "$WALLPAPER"
#     hyprctl hyprpaper wallpaper ,"$WALLPAPER"
#     ${pkgs.matugen}/bin/matugen image "$WALLPAPER" -t schema-fidelity >> /tmp/matugen.log 2>&1
#     pkill waybar
#     waybar
#   ''

#
# pkgs.writeShellScriptBin "set-wallpaper" ''
#   # Asegurar que HOME esté definido si se lanza desde un daemon
#   export HOME="''${HOME:-/home/arroio}"
#
#   # Buscar el fondo
#   WALLPAPER=$(${pkgs.findutils}/bin/find "$HOME/Pictures/Wallpapers" -type f \( -iname "*.jpg" -o -iname "*.png" \) | ${pkgs.coreutils}/bin/shuf -n 1)
#
#   if [ -z "$WALLPAPER" ]; then
#     echo "No wallpaper found!" >> /tmp/hyprpaper.log
#     exit 1
#   fi
#
#   echo "Selected wallpaper: $WALLPAPER" >> /tmp/hyprpaper.log
#
#   # Hyprpaper
#   ${pkgs.procps}/bin/pgrep hyprpaper >/dev/null || hyprpaper & sleep .5
#   ${pkgs.hyprland}/bin/hyprctl hyprpaper preload "$WALLPAPER"
#   ${pkgs.hyprland}/bin/hyprctl hyprpaper wallpaper ",$WALLPAPER"
#
#   ${pkgs.matugen}/bin/matugen image "$WALLPAPER" --type scheme-fidelity --show-colors --source-color-index 0 > /tmp/matugen.log 
#
#   # Reiniciar Waybar
#   ${pkgs.procps}/bin/pkill waybar
#   waybar & disown
# ''


pkgs.writeShellScriptBin "set-wallpaper" ''
  export HOME="''${HOME:-/home/arroio}"
  WALLPAPER=$(${pkgs.findutils}/bin/find "$HOME/Pictures/Wallpapers" -type f \( -iname "*.jpg" -o -iname "*.png" \) | ${pkgs.coreutils}/bin/shuf -n 1)
  if [ -z "$WALLPAPER" ]; then
    echo "No wallpaper found!" >> /tmp/hyprpaper.log
    exit 1
  fi
  echo "Selected wallpaper: $WALLPAPER" >> /tmp/hyprpaper.log
  ${pkgs.procps}/bin/pgrep hyprpaper >/dev/null || hyprpaper & sleep .5
  ${pkgs.hyprland}/bin/hyprctl hyprpaper preload "$WALLPAPER"
  ${pkgs.hyprland}/bin/hyprctl hyprpaper wallpaper ",$WALLPAPER"
  ${pkgs.matugen}/bin/matugen image "$WALLPAPER" --type scheme-fidelity --source-color-index 0 --fallback-color "#808080" > /tmp/matugen.log 2>&1
  ${pkgs.procps}/bin/pkill waybar
  waybar & disown
''
