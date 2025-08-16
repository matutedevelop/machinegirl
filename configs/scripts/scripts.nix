{ pkgs }:

{


    set-wallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
      WALLPAPER=$(find "$HOME/Pictures/Wallpapers" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)
      echo "Selected wallpaper: $WALLPAPER" >> /tmp/hyprpaper.log
      pgrep hyprpaper >/dev/null || hyprpaper &
      sleep 0.5
      hyprctl hyprpaper preload "$WALLPAPER"
      hyprctl hyprpaper wallpaper ,"$WALLPAPER"
      wal -i "$WALLPAPER"
      pkill waybar
      waybar
    '';


# === === === === === === === === === === === === ===

  rofi-audio = pkgs.writeShellScriptBin "rofi-audio" ''
#!/usr/bin/env bash

# Opciones para el menú
options=" Subir volumen\n Bajar volumen\n Mutear/Desmutear\n󰋋 Cambiar salida"

# Mostrar menú
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Audio")

case "$chosen" in
    " Subir volumen")
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    " Bajar volumen")
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    " Mutear/Desmutear")
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    "󰋋 Cambiar salida")
        # Listar dispositivos de salida y seleccionar
        sinks=$(pactl list short sinks | awk '{print $2}')
        sink=$(echo "$sinks" | rofi -dmenu -i -p "Selecciona salida")
        [[ -n "$sink" ]] && pactl set-default-sink "$sink"
        ;;
esac

  '';

}
