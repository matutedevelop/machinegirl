{ pkgs }:

{

  rmd = pkgs.writeShellScriptBin "rmd" ''
    #!/usr/bin/env bash

    # Verifica que se haya pasado un archivo
    if [ -z "$1" ]; then
      echo "Uso: $0 archivo.Rmd"
      exit 1
    fi

    FILE="$1"   
    echo $FILE


    # Ejecuta la renderización con R

    R -e "rmarkdown::render(\"$FILE\")"
  '';

  # === === === === === === === === === === === === ===

  hyproled = pkgs.writeShellScriptBin "hyproled" ''


#!/bin/bash

cd /home/arroio/Dev/TOOLS/hyproled
bash hyproled 

    '';

  # === === === === === === === === === === === === ===

  # === === === === === === === === === === === === ===

  hyproledo = pkgs.writeShellScriptBin "hyproledo" ''


#!/bin/bash

cd /home/arroio/Dev/TOOLS/hyproled
bash hyproled off

    '';

  # === === === === === === === === === === === === ===


  notebook = pkgs.writeShellScriptBin "notebook" ''
    #!/usr/bin/env bash

    # Asegura que Python pueda encontrar libstdc++.so.6
    export LD_LIBRARY_PATH=/run/current-system/sw/lib:$LD_LIBRARY_PATH

    dataspell

  '';
  # === === === === === === === === === === === === ===
  set-wallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
    WALLPAPER=$(find "$HOME/Pictures/Wallpapers" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)
    echo "Selected wallpaper: $WALLPAPER" >> /tmp/hyprpaper.log
    pgrep hyprpaper >/dev/null || hyprpaper & sleep .5
    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper ,"$WALLPAPER"
    wal -i "$WALLPAPER" --backend colorthief
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
            pactl set-sink-volume @DEFAULT_SINK@ +15%
            ;;
        " Bajar volumen")
            pactl set-sink-volume @DEFAULT_SINK@ -15%
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
