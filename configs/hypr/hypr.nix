
{config, pkgs, ... }:
{

#  <==><==><==> <==><==><==><==><==><==><==><==><==><==><==><==> <==><==><==> 

#  <==><==><==> <==><==><==><==><==><==><==><==><==><==><==><==> <==><==><==> 

#  <==><==><==> <==><==><==><==><==><==><==><==><==><==><==><==> <==><==><==> 
# __________________
#< hyperland config >
# ------------------
#        \   ^__^
#         \  (oo)\_______
#            (__)\       )\/\
#                ||----w |
#                ||     ||
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";



      exec-once = [
        "swaync"
        "waybar"
        "hyprpaper"
        "set-wallpaper"
      ];

      # Monitor config
      monitor = "DP-1, 2560x1080@60, 0x0,1";
     
# === === === === === === === === === === === === === === === === === === 
# General === === === === === === === === === === === === === === === === 
# === === === === === === === === === === === === === === === === === === 
     general = {     


      

     "border_size" = "3";

       "gaps_in" = "30";

       "gaps_out" = "80";

       "gaps_workspaces" = "3";

       "resize_on_border" = "true";

       #"col.inactive_border" = "rgba(0,0,0,75) rgba(123,135,135,90) 60deg";
       "col.inactive_border" = "rgb(0,0,0) rgb(11,11,30) 120deg";


       "col.active_border" = "rgb(92,22,8) rgb(0,0,0) 120deg";

	 };
     


# === === === === === === === === === === === === === === === === === === 
# Decoration === === === === === === === === === === === === === === === === 
# === === === === === === === === === === === === === === === === === === 

    decoration = {

        "rounding" = "5";

        "rounding_power" = "3";

        "inactive_opacity" = "0.7";
        
        "active_opacity" = "0.9";
        
        "fullscreen_opacity" = "1";
        
    blur = {

        "size" = "7";

        "passes" = "2";

        "popups" = "true";

        "brightness" = "1";
 
        "contrast" = "1.3";


    };

    };

 animations = {
    enabled = "yes";

    bezier = [
      "smooth, 0.25, 0.1, 0.25, 1.0"
      "springy, 0.05, 0.7, 0.1, 1.0"
    ];

    animation = [
      "windows, 1, 3, smooth, slide"
      "border, 1, 3, smooth"
      "fade, 1, 5, smooth"
      "workspaces, 1, 4, springy, slidevert"
    ];
  };

    windowrule = [
        "opacity 0.9 0.5, class:^(discord)$"
        "opacity 0.7 0.5, class:^(spotify)$"
        "opacity 0.6 0.5, class:^(wezterm)$"
    ];


      bind =
        [
          "$mod,F, exec, zen"
          "$mod SHIFT,M, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
          "$mod,T, exec, wezterm"
          "$mod SHIFT,S, exec, hyprshot -m region"
          "ALT, SPACE, exec, rofi -show drun"
          "$mod,Q, killactive"
	  "ALT, Tab, exec, rofi -show window"
          "$mod SHIFT,E, exec, rofi -show filebrowser"  
          "$mod,E, exec,  nemo"  
          "$mod,M, exec, rofi-audio"
          "$mod,left, exec, playerctl previous"
          "$mod,right, exec, playerctl next"
          "$mod,up, exec, playerctl play-pause"

          # Dispatchers === === === === === === ===


            # Navegacion <==> <==> <==> <==> <==>
            "SHIFT, H, movefocus, l"
            "SHIFT, J, movefocus, d"
            "SHIFT, K, movefocus, u"
            "SHIFT, L, movefocus, r"




            
            # Mover ventanas <==> <==> <==> <==> <==>


           "$mod CTRL, h, resizeactive, -50 0"
           "$mod CTRL, l, resizeactive, 50 0"
           "$mod CTRL, k, resizeactive, 0 -50"
           "$mod CTRL, j, resizeactive, 0 50"


            # Mover ventanas <==> <==> <==> <==> <==>

            "ALT, H, movewindow, l"
            "ALT, J, movewindow, d"
            "ALT, K, movewindow, u"
            "ALT, L, movewindow, r"

            "$mod, 0, fullscreen"
            "$mod, p, togglefloating"

            # Scroll con flechas

   #         "CONTROL, down, exec, wlrctl pointer scroll 120 0 "
   #         "CONTROL, up, exec, wlrctl pointer scroll -120 0"


            # Move to workspace
            #"$mod ALT, 1, movetoworkspace, 1"
            #"$mod ALT, 2, movetoworkspace, 2"
            #"$mod ALT, 3, movetoworkspace, 3"
            #"$mod ALT, 4, movetoworkspace, 4"
            #"$mod ALT, 5, movetoworkspace, 5"
            #"$mod ALT, 6, movetoworkspace, 6"
            #"$mod ALT, 7, movetoworkspace, 7"
            #"$mod ALT, 8, movetoworkspace, 8"
            #"$mod ALT, 9, movetoworkspace, 9"




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





#  <==><==><==> <==><==><==><==><==><==><==><==><==><==><==><==> <==><==><==> 
# __________________
#< End hyperland config >
# ------------------
#        \   ^__^
#         \  (oo)\_______
#            (__)\       )\/\
#                ||----w |
#                ||     ||

}
