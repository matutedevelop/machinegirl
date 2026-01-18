{ pkgs }:

pkgs.writeShellScriptBin "cava-waybar" ''
  #!/usr/bin/env bash

  bar="▁▂▃▄▅▆▇█"

  dict="s/;//g;"

  i=0
  while [ $i -lt ''${#bar} ]; do
    dict="''${dict}s/$i/''${bar:$i:1}/g;"
    i=$((i+1))
  done

  config_file="/tmp/waybarbar_cava_config"
  cat > "$config_file" <<EOF
[general]
bars = 12

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

  cava -p "$config_file" | while read -r line; do
    echo "$line" | sed "$dict"
  done
''

