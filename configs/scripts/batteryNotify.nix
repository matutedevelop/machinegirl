{pkgs}:

{
  batteryNotify = pkgs.writeShellScriptBin "battery-notify" ''


    #!/usr/bin/env bash

    BATTERY=$(upower -e | grep BAT)
    INFO=$(upower -i "$BATTERY")

    PERCENT=$(echo "$INFO" | grep percentage | awk '{print $2}' | tr -d '%')
    STATE=$(echo "$INFO" | grep state | awk '{print $2}')

    LOW=20
    CRITICAL=10

    if [[ "$STATE" == "discharging" ]]; then
      if (( PERCENT <= CRITICAL )); then
        notify-send -u critical "Battery is very low " "plug in ASAP"
      elif (( PERCENT <= LOW )); then
        notify-send -u normal "Battery is low" "pero tienes chance mi vro"
      fi
    fi



    '';

}
