{config, pkgs, ... }:

{
#   imports =[
#
#	./configs/hypr/hypr.nix
 #  ];

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












  programs.kitty.enable = true; # required for the default Hyprland config



  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      exec-once = [
        "swaync"
        "waybar"
	"hyprpaper"
      ];

      # Monitor config
      monitor = "LG, highres, auto,1.5";
      

      # General

      

      #"border_size" = "0.75";

         # Gaps
       #   "gaps_in"= "7.5";

        #  "gaps_out" = "30";

	 

      bind =
        [
          "$mod,F, exec, firefox"
          "$mod SHIFT,S, exec, hyprshot -m region"
          "ALT, SPACE, exec, rofi -show drun"
          "$mod,Q, killactive"
	  "ALT, Tab, exec, rofi -show window"
          "$mod SHIFT,E, exec, rofi -show filebrowser"  
          "$mod,E, exec,  dolphin"  
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







  
  nixpkgs.config.allowUnfree = true;
  


  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "arroio";
  home.homeDirectory = "/home/arroio";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  
  # -----------------------------------------------------------------------
  # -----------------------------------------------------------------------
  # -----------------------------------------------------------------------
















  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    #(pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" "JetBrainsMono" "IosevkaTerm" "Monoid"]; })
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka-term
    nerd-fonts.monoid
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    
    #Dev
    home-manager
    git
    neo-cowsay
    neovim
    kitty
    
    # Hyperland requirements
    
    hyprshot
    hyprpaper
    hyprlock
    hypridle    
    hyprpolkitagent
    qt5.qtwayland
    qt6.qtwayland
    hyprpicker


    # Desktop
    waybar
    rofi-wayland
    swaynotificationcenter
    pywal
    neofetch
    smassh

    # Utilities

    imagemagick
    pavucontrol
    swayimg
    rofi-file-browser
    tmux
    rofi-power-menu


    #Knowledge

    zathura
    obsidian

    # python 

    (python313.withPackages(ps: with ps; [ 
    
    pandas
    geopandas
    requests
    numpy
    scipy
    matplotlib
    seaborn
    tkinter
    scikit-learn
    statsmodels
    pytorch
    jax
    numba

    ]))
    jetbrains.pycharm-community

    # Productivity
    gimp3

    


    #rust
    rustc
    rustfmt
    cargo
    clippy
  ];

  # configs

    programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./configs/wezterm/wezterm.lua;
  };


    programs.git = {
    enable = true;
    userName  = "arroio";
    userEmail = "juan.arroyo@iteso.mx";
  };





  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".config/rofi/config.rasi".source = ./configs/rofi/config.rasi;
    ".config/waybar/config.json".source = ./configs/waybar/config.json;
    ".config/waybar/style.css".source = ./configs/waybar/style.css;

    
  };


    


    

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/arroio/etc/profile.d/hm-session-vars.sh
  #




  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;



}






