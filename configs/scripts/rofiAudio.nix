{pkgs}:
{

  rofiAudio = pkgs.writeShellScriptBin "rofi-audio" ''

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
