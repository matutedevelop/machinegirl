{ pkgs, inputs, scripts, ...}:
with pkgs;
[

  # # Adds the 'hello' command to your environment. It prints a friendly
  # # "Hello, world!" when run.
  # pkgs.hello

  # # It is sometimes useful to fine-tune packages, for example, by applying
  # # overrides. You can do that directly here, just don't forget the
  # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
  # # fonts?
  #(pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" "JetBrainsMono" "IosevkaTerm" "Monoid"]; })
  # # You can also create simple shell scripts directly inside your
  # # configuration. For example, this adds a command 'my-hello' to your
  # # environment:
  # (pkgs.writeShellScriptBin "my-hello" ''
  #   echo "Hello, ${config.home.username}!"
  # '')


  #Dev
  home-manager
  pokemonsay
  pokemon-colorscripts-mac
  #n8n
  fzf
  bat
  wget
  ripgrep
  btop
  fd


  # gpu
  nvtopPackages.nvidia
  mesa-demos
  gpu-viewer
  wgpu-utils
  wgpu-native
  supergfxctl
  # bc
  nvidia-container-toolkit
  cudaPackages.cudnn
  devenv
  mlflow-server



  # Agents

  opencode
  # codex
  # vllm # broken
   # (pkgs.symlinkJoin {
   #    name = "pi-coding-agent";
   #    buildInputs = [ pkgs.makeWrapper ];
   #    paths = [ pkgs.pi-coding-agent ];
   #    postBuild = ''
   #      wrapProgram $out/bin/pi \
   #        --set NPM_CONFIG_PREFIX "$Home/.pi/npm/" \
   #        --prefix PATH : ${
   #          pkgs.lib.makeBinPath [
   #            pkgs.nodejs_latest
   #          ]
   #        }
   #    '';
   #  })
   inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.pi

    


  #containers
  docker

  #Cloud
  google-cloud-sdk-gce
  cloudflared

  # zen
  inputs.zen-browser.packages.${pkgs.system}.default
  chromium
  chromedriver



  # Hyperland requirements

  hyprshot
  hyprpaper
  hyprlock
  hypridle
  hyprpolkitagent
  hyprshade
  qt5.qtwayland
  qt6.qtwayland
  hyprpicker
  wayland
  libxkbcommon


  # Desktop
  waybar
  swaynotificationcenter
  libnotify
  fastfetch
  nemo-with-extensions
  waypaper
  cavalier
  vlc
  vesktop
  #discord
  davinci-resolve
  libreoffice-fresh

  lenovo-legion
  liquidctl
  coolercontrol.coolercontrol-gui


  # Databases
  #postgresql_18


  # Utilities

  imagemagick
  hyprpicker
  pavucontrol
  swayimg
  rofi
  rofi-power-menu
  rofi-bluetooth
  rofi-network-manager
  tint
  pandoc
  wlrctl
  pulseaudioFull
  playerctl
  pamixer
  brightnessctl
  pdf2svg
  xclip
  #cliphist
  wl-clipboard
  #open-webui
  # gnuplot
  obs-studio
  scripts.rofiAudio
  scripts.setWallpaper
  scripts.hyproled
  scripts.hyproledo
  scripts.batteryNotify
  scripts.cavaWaybar
  scripts.mdToTypst
  scripts.tmuxTermToggle


  #Knowledge

  zathura
  obsidian
  typst
  anki-bin


  # Haskell
  haskell-ci
  fourmolu
  (ghc.withPackages
    (hsPkgs: with hsPkgs; [
      turtle # Faster startup time with all external shell commands
      shh # Piping operators and other goodies
      shh-extras # Try shh as an interactive shell
    ])
  )



  # python
  uv
  maturin
  (python313.withPackages (ps: with ps; [

    # Jupyter
    pip

    qdrant-client
    jupyterlab
    xgboost
    openai
    ipywidgets
    ipycanvas
    unidecode
    nltk
    google-genai
    # ollama

    # azure-storage-blob

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
    # torch
    #torchWithCuda
    #torch-bin
    yfinance
    jax
    cupy
    numba
    pydantic
    pywal
    graphviz
    optuna
    #colorthief
    #colorzero
    #colormath

    # flet  broken
    # flet-web
    # flet-desktop
    selenium
    webdriver-manager

    pyspark
    snowflake
    #dlt

    fastapi
    uvicorn
    #bcrypt
    #pymc
    #arviz

  ]))
  ty
  jetbrains.datagrip
  jetbrains.pycharm


  # Productivity
  gimp3
  #inkscape

  # C
  gcc
  zeromq

  # Rust
  rustc
  rustfmt
  cargo
  clippy

  # Matlab kindoff
  # octave

  # Go
  go
  gopls
  golangci-lint
  delve


  #JS
  nodejs_24
  bun

  # # R
  # (rstudioWrapper.override {
  #   packages = with rPackages; [
  #     AmesHousing
  #     agricolae
  #     EnvStats
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
  #     tidyr
  #   ];
  # })
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

]
