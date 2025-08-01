
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

    # Fondo de pantalla === === === === === === === === ===
    "hyprpaper"
    "sleep 0.5 && hyprctl hyprpaper preload /home/arroio/Pictures/fondo_nuevo.png"
    "sleep 1 && hyprctl hyprpaper wallpaper ,/home/arroio/Pictures/fondo_nuevo.png"
    "wal -i ~/Pictures/fondo_nuevo.png"
      ];

      # Monitor config
      monitor = "DP-1, 2560x1080@60, 0x0,1";
     
# === === === === === === === === === === === === === === === === === === 
# General === === === === === === === === === === === === === === === === 
# === === === === === === === === === === === === === === === === === === 
     general = {     


      

     "border_size" = "1";

       "gaps_in" = "10";

       "gaps_out" = "40";

       "gaps_workspaces" = "5";

       "resize_on_border" = "true";
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

        "size" = "12";

        "passes" = "2";

        "popups" = "true";

        "brightness" = "1";
 
        "contrast" = "1.3";


    };

    };




      bind =
        [
          "$mod,F, exec, firefox"
          "$mod SHIFT,S, exec, hyprshot -m region"
          "ALT, SPACE, exec, rofi -show drun"
          "$mod,Q, killactive"
	  "ALT, Tab, exec, rofi -show window"
          "$mod SHIFT,E, exec, rofi -show filebrowser"  
          "$mod,E, exec,  nemo"  

          # Dispatchers === === === === === === ===


            # Navegacion <==> <==> <==> <==> <==>
            "SHIFT, H, movefocus, l"
            "SHIFT, J, movefocus, d"
            "SHIFT, K, movefocus, u"
            "SHIFT, L, movefocus, r"



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
