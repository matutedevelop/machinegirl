{config, pkgs, ... }:

{
#   imports =[

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




  # GTK 

  gtk = {

  enable = true;
  theme = {
    package = pkgs.gruvbox-gtk-theme;
    name = "Gruvbox-Dark";
    };
  font = {
    name = "IosevkaTerm Nerd Font";
    size = 14;
    };

    iconTheme = {
    package = pkgs.tela-circle-icon-theme;
    name = "Tela-red-dark"; # A menudo el tema de iconos tiene el mismo nombre

  };

  };



  
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
    #nerd-fonts.fantasque-sans-mono
    #nerd-fonts.jetbrains-mono
    #nerd-fonts.iosevka-term
    #nerd-fonts.monoid
    #nerd-fonts.fira-code
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
    #neovim
    kitty
    yazi-unwrapped
    # zoxide
    lunarvim
    
    

    # Java
    jdk
    
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
    fastfetch
    smassh
    nemo-with-extensions

    # Utilities

    imagemagick
    pavucontrol
    swayimg
    rofi-file-browser
    tmux
    rofi-power-menu
    tint
    # dotool
    wlrctl


    #Knowledge

    zathura
    obsidian

    # Haskell
    haskell-ci



    # python 

    (python313.withPackages(ps: with ps; [ 
    
    # Jupyter
    pip
    notebook
    jupyterlab


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
    pydantic

    ]))
    jetbrains.pycharm-professional
    # jetbrains.pycharm-community
    jetbrains.dataspell
    pyrefly

    # Productivity
    gimp3

    
    # C
    gcc
    zeromq

    # Rust
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


  programs.zoxide = {
  enable = true;
  enableBashIntegration = true;
  };

 
# Neovim === === === === === === === === === 

# La mayoria de los plugins se desea de administrar atraves de Lazy y declarando los dotfiles con home-manager, este apartado es exclusivo para aquellos plugins que no puedan ser instalados de esta forma _e.g._ linters, formatters, lsp






    programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;

        #plugins = with pkgs.vimPlugins;[
        # nvim-lspconfig       # El plugin principal para configurar LSPs
         #nvim-cmp             # Motor de autocompletado
         #cmp-nvim-lsp         # Fuente LSP para nvim-cmp
         #cmp_luasnip          # Fuente de snippets para nvim-cmp
         #conform-nvim         # Gestor de formatters
         #nvim-lint            # Gestor de linters


        #];

    extraPackages = with pkgs; [

          # Python
          (python3.withPackages (ps: with ps; [
            setuptools # Required by pylama for some reason
            pylama
            isort
            yamllint
            debugpy
          ]))
          ruff
          python313Packages.python-lsp-server



          # Lua
          lua-language-server
          selene
          stylua

          # Nix
          statix
          nixpkgs-fmt
          nil

          # C, C++
          clang-tools
          cppcheck

          # Rust
          rust-analyzer
          clippy
          rustfmt


          # Go
          go
          gopls
          golangci-lint
          delve

      ];


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
    ".config/waybar/config".source = ./configs/waybar/config.json;
    ".config/waybar/style.css".source = ./configs/waybar/style.css;
 
    # neovim config

    ".config/nvim".source = ./configs/nvim;

    # Zathura

    ".config/zathura".source = ./configs/zathura;

    
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

  # Bash
  programs.bash = {
    enable = true;
    shellAliases = {

 #     z = "zoxide";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/#arroio";
      explorer = "yazi";
      fast = "fastfetch";
      wal = "wal -i";

    };

  };

}






