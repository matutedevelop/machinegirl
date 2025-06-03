{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      exec-once = [
        "swaync"
        "waybar"
      ];

      # Monitor config
      monitor = "LG, highres, auto,1";

      bind =
        [
          "$mod, F, exec, firefox"
          "$mod, SHIFT, S, exec, hyprshot -m region"
          ",ALT, SPACE, exec, rofi -show run"
          "$mod, Q, killactive"
        ]
        ++ (
          builtins.concatLists (builtins.genList (i:
            let
              ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ])
          9)
        );
    };
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}

