{ pkgs }:

{
 batteryNotify = import ./batteryNotify.nix {inherit pkgs;};
 hyproled = import ./hyproled.nix {inherit pkgs;};
 hyproledo = import ./hyproledo.nix {inherit pkgs;};
 rofiAudio = import ./rofiAudio.nix {inherit pkgs;};
 setWallpaper = import ./setWallpaper.nix {inherit pkgs;};
}

#   # === === === === === === === === === === === === ===
#
#   batteryNotify = pkgs.writeShellScriptBin "battery-notify" ''
#
#
#     #!/usr/bin/env bash
#
#     BATTERY=$(upower -e | grep BAT)
#     INFO=$(upower -i "$BATTERY")
#
#     PERCENT=$(echo "$INFO" | grep percentage | awk '{print $2}' | tr -d '%')
#     STATE=$(echo "$INFO" | grep state | awk '{print $2}')
#
#     LOW=20
#     CRITICAL=10
#
#     if [[ "$STATE" == "discharging" ]]; then
#       if (( PERCENT <= CRITICAL )); then
#         notify-send -u critical "Battery is very low " "plug in ASAP"
#       elif (( PERCENT <= LOW )); then
#         notify-send -u normal "Battery is low" "pero tienes chance mi vro"
#       fi
#     fi
#
#
#
#     '';
#
#   # === === === === === === === === === === === === ===
#
#
#   # === === === === === === === === === === === === ===
#
#   hyproled = pkgs.writeShellScriptBin "hyproled" ''
#
#
#
# cd /home/arroio/Dev/TOOLS/hyproled
# bash hyproled 
#
#     '';
#
#   # === === === === === === === === === === === === ===
#
#   # === === === === === === === === === === === === ===
#
#   hyproledo = pkgs.writeShellScriptBin "hyproledo" ''
#
#
#
# cd /home/arroio/Dev/TOOLS/hyproled
# bash hyproled off
#
#     '';
#
#   setWallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
#     WALLPAPER=$(find "$HOME/Pictures/Wallpapers" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)
#     echo "Selected wallpaper: $WALLPAPER" >> /tmp/hyprpaper.log
#     pgrep hyprpaper >/dev/null || hyprpaper & sleep .5
#     hyprctl hyprpaper preload "$WALLPAPER"
#     hyprctl hyprpaper wallpaper ,"$WALLPAPER"
#     wal -i "$WALLPAPER" --backend colorthief
#     pkill waybar
#     waybar
#   '';
#
#
#   # === === === === === === === === === === === === ===
#
#   rofiAudio = pkgs.writeShellScriptBin "rofi-audio" ''
#
#     # Opciones para el menú
#     options=" Subir volumen\n Bajar volumen\n Mutear/Desmutear\n󰋋 Cambiar salida"
#
#     # Mostrar menú
#     chosen=$(echo -e "$options" | rofi -dmenu -i -p "Audio")
#
#     case "$chosen" in
#         " Subir volumen")
#             pactl set-sink-volume @DEFAULT_SINK@ +15%
#             ;;
#         " Bajar volumen")
#             pactl set-sink-volume @DEFAULT_SINK@ -15%
#             ;;
#         " Mutear/Desmutear")
#             pactl set-sink-mute @DEFAULT_SINK@ toggle
#             ;;
#         "󰋋 Cambiar salida")
#             # Listar dispositivos de salida y seleccionar
#             sinks=$(pactl list short sinks | awk '{print $2}')
#             sink=$(echo "$sinks" | rofi -dmenu -i -p "Selecciona salida")
#             [[ -n "$sink" ]] && pactl set-default-sink "$sink"
#             ;;
#     esac
#
#   '';
# }

