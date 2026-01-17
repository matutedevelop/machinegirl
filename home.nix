{ config, pkgs, inputs, ... }:

let
  scripts = import ./configs/scripts/scripts.nix { inherit pkgs; };
in

{
  imports = [
    ./configs/hypr/hypr.nix
    ./configs/tmux/tmux.nix
    inputs.spicetify-nix.homeManagerModules.default
  ];




  # GTK

  gtk = {

    enable = true;
    theme = {
      package = pkgs.graphite-gtk-theme;
      name = "Graphite-Dark";
    };
    font = {
      name = "IosevkaTerm Nerd Font";
      size = 14;
    };

    iconTheme = {
      package = pkgs.whitesur-icon-theme;
      name = "WhiteSur";

    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
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




  # The home.packages option allows you to install Nix packages into your
  # environment.




  home.packages = with pkgs;
    [

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
      #dumb games
      bsdgames
      _2048-in-terminal


      #Dev
      home-manager
      pokemonsay
      pokete
      pokemon-colorscripts-mac
      kitty
      yazi-unwrapped
      n8n
      fzf
      bat
      wget
      ripgrep
      btop
      nvtopPackages.nvidia


      #Cloud
      google-cloud-sdk-gce
      cloudflared

      # zen
      inputs.zen-browser.packages.${pkgs.system}.default
      chromium
      chromedriver


      # Java
      #jdk
      #jdt-language-server

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
      rofi
      swaynotificationcenter
      libnotify
      dunst
      fastfetch
      nemo-with-extensions
      waypaper
      cavalier
      cava
      vlc
      lenovo-legion



      # Utilities

      imagemagick
      hyprpicker
      pavucontrol
      swayimg
      rofi-power-menu
      rofi-calc
      rofi-bluetooth
      rofi-network-manager
      tint
      pandoc
      # dotool
      wlrctl
      pulseaudioFull
      playerctl
      pamixer
      brightnessctl
      pdf2svg
      xclip
      cliphist
      scripts.rofiAudio
      scripts.setWallpaper
      scripts.hyproled
      scripts.hyproledo
      scripts.batteryNotify
      scripts.cava-waybar


      #Knowledge

      zathura
      obsidian
      typst
      anki-bin
      sherlock

      # Haskell
      haskell-ci



      # python
      uv
      maturin
      (python313.withPackages (ps: with ps; [

        # Jupyter
        pip
        python-dotenv
        jupyterlab
        xgboost
        openai
        ipywidgets
        ipycanvas
        unidecode
        nltk
        google-genai

        fastparquet
        xlib
        mpl-typst
        typst
        plotly
        pandas
        openpyxl
        opencv4
        geopandas
        polars
        requests
        numpy
        scipy
        matplotlib
        seaborn
        tkinter
        scikit-learn
        kneed
        umap-learn
        statsmodels
        torch
        yfinance
        jax
        numba
        pydantic
        pywal
        graphviz
        optuna
        colorthief
        colorzero
        colormath
        flet
        flet-web
        flet-desktop
        selenium
        webdriver-manager
      ]))
      ty
      jetbrains.pycharm-professional
      jetbrains.dataspell
      jetbrains.datagrip

      # Productivity
      gimp3
      inkscape

      # C
      gcc
      zeromq

      # Rust
      rustc
      rustfmt
      cargo
      clippy


      # Go
      go
      gopls
      golangci-lint
      delve


      #JS
      nodejs_20

      # R
      pandoc
      (rstudioWrapper.override {
        packages = with rPackages; [
          AmesHousing
          agricolae
          EnvStats
          rmarkdown
          fastDummies
          knitr
          yaml
          htmltools
          dplyr
          ggplot2
          languageserver
          readxl
          moments
          BSDA
          tidyr
        ];
      })
      # (rWrapper.override {
      #   packages = with rPackages; [
      #
      #     rmarkdown
      #     fastDummies
      #     knitr
      #     yaml
      #     htmltools
      #     dplyr
      #     ggplot2
      #     languageserver
      #     readxl
      #     moments
      #     BSDA
      #
      #
      #   ];
      # })

    ];




  #  === === === === === === === === === === === === === === === === === === ===
  # configs === === === === === === === === === === === === === === === === ===
  #  === === === === === === === === === === === === === === === === === === ===

  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./configs/wezterm/wezterm.lua;
  };

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle # shuffle+ (special characters are sanitized out of extension names)
        powerBar
        groupSession
      ];
      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        ncsVisualizer
      ];
      enabledSnippets = with spicePkgs.snippets; [
        rotatingCoverart
        pointer
      ];

      theme = spicePkgs.themes.text;
      #colorScheme = "Kanagawa";
    };

  programs.git = {
    enable = true;
    userName = "arroio";
    userEmail = "juan.arroyo@iteso.mx";
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      command_timeout = 1300;
      scan_timeout = 50;

      format = "$username$directory$git_branch$git_commit$git_state$git_status$nix_shell$python$rust$go$java$docker$character";


      character = {
        success_symbol = "λ";
        error_symbol = "[✗](bold red) ";
      };

      fill = {
        symbol = " ";
      };
    };
  };


  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };


  # Bash
  programs.bash = {
    enable = true;
    initExtra = "walr";
    shellAliases = {

      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/#arroio";
      explorer = "yazi";
      fast = "fastfetch";
      py = "python";
      pip2nixx = "nix run github:nix-community/pip2nix";
      walr = "cat /home/arroio/.cache/wal/sequences";
      fzz = ''nvim $(fzf -m --preview="bat --color=always {}")'';
      brillo = "brightnessctl s";

    };
  };
  # Neovim === === === === === === === === ===

  # La mayoria de los plugins se desea de administrar atraves de Lazy y declarando los dotfiles con home-manager, este apartado es exclusivo para aquellos plugins que no puedan ser instalados de esta forma _e.g._ linters, formatters, lsp






  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins;[
      # nvim-lspconfig       # El plugin principal para configurar LSPs
      #nvim-cmp             # Motor de autocompletado
      #cmp-nvim-lsp         # Fuente LSP para nvim-cmp
      #cmp_luasnip          # Fuente de snippets para nvim-cmp
      #conform-nvim         # Gestor de formatters
      #nvim-lint            # Gestor de linters
      lazy-nvim

    ];

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
      ty
      pyright

      ripgrep


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

      # Java
      jdt-language-server
      google-java-format

      # Haskell
      haskell-language-server
      fourmolu


      # Go
      go
      gopls
      golangci-lint
      delve

      # Typst
      tinymist


      lazygit


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
    ".config/waybar".source = ./configs/waybar;

    # neovim config

    ".config/nvim".source = ./configs/nvim;

    # Zathura

    ".config/zathura".source = ./configs/zathura;


    # Nix conf
    ".config/nix/nix.conf".source = ./configs/nix/nix.conf;

    # Hyprlock
    ".config/hypr/hyprlock.conf".source = ./configs/hypr/hyprlock.conf;
    ".config/hypr/hypridle.conf".source = ./configs/hypr/hypridle.conf;

    # hyproled
    "Dev/TOOLS/hyproled/hyproled".source = ./configs/scripts/nixint/hyproled;

    # Hyprpaper
    ".config/hypr/hyprpaper.conf".source = ./configs/hypr/hyprpaper.conf;

    # rofi theme
    ".config/rofi/themes/wal.rasi".source = ./configs/rofi/wal.rasi;


    # fastfetch
    ".config/fastfetch".source = ./configs/fastfetch;




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


  home.sessionVariables = { };


# === === === === === === === === === === ===
# === === === === === === === === === === ===
# === === === === === === === === === === ===

  #systemd 
  systemd.user.services.battery-notify = {

    Unit = {
      Description = "Battery notification";
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${scripts.batteryNotify}/bin/battery-notify";
    };

  };


  systemd.user.timers.battery-notify = {
    Unit = {
      Description = "Run battery-notify periodically";
    };

    Timer = {
      OnBootSec = "2m";
      OnUnitActiveSec = "5m";
    };

    Install = {
      WantedBy = [ "timers.target" ];
    };
  };

# === === === === === === === === === === ===
# === === === === === === === === === === ===
# === === === === === === === === === === ===


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}





