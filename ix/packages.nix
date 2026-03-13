{ pkgs, ... }:
{

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
      _2048-in-terminal


      #Dev
      home-manager
      pokemonsay
      pokete
      pokemon-colorscripts-mac
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
      swaynotificationcenter
      libnotify
      fastfetch
      nemo-with-extensions
      waypaper
      cavalier
      cava
      vlc
      lenovo-legion


    # nvdia
    cudatoolkit
    cudaPackages.cudnn



      # Utilities

      imagemagick
      pavucontrol
      swayimg
      rofi
      rofi-power-menu
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
      #cliphist
      #wl-clipboard
      kdePackages.kalgebra
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
      #anki-bin
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
      # jetbrains.pycharm-professional
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
}
