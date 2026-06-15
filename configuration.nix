# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];


  # Hyperland

  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyperland.packages.${pkgs.system}.hyprland;




  # greetd
  services.greetd.enable = true;
  services.greetd.settings = {
    default_session = {
      command = "Hyprland";
      user = "arroio";
    };
  };





  # PipeWire
  # Remove sound.enable or set it to false if you had it set previously, as sound.enable is only meant for ALSA-based configurations

  # rtkit is optional but recommended
  #security.rtkit.enable = true;
  #services.pipewire = {
  #enable = true;
  # alsa.enable = true;
  #alsa.support32Bit = true;
  #pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;
  #};






  # Allow unfree packages

  nixpkgs.config.allowUnfree = true;



  # Bootloader.

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.devices = [ "nodev" ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.loader.systemd-boot.enable = false;
  boot.kernelPackages = pkgs.linuxPackages;
  boot.loader.grub.configurationLimit = 5;





  networking.hostName = "nixos-arroio"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # cachix
  nix.settings = {

 trusted-users = [ "root" "@wheel" "arroio" ];
  substituters = [
    "https://cache.nixos.org"
    "https://cuda-maintainers.cachix.org"
    "https://hyprland.cachix.org"
  ];
  trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
  ];
};


  # === NETWORKING

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.firewall.allowedTCPPorts = [ 11434 ];

  # === NETWORKING

  # === === === === ===
  # === === === === ===
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # === === === === ===
  # === === === === ===
  # === NVDIA ===

  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.graphics.enable = true;



  # === === === === ===
  # === === === === ===
  # === docker ===
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };
  hardware.nvidia-container-toolkit.enable = true;

  # === === === === ===
  # === === === === ===
  # === Legion ===










  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;

  # Poweprofiles
  services.power-profiles-daemon.enable = true;


  # ollama
  services.ollama.enable = true;
  services.ollama.package = pkgs.ollama-cuda;
  services.ollama.host = "0.0.0.0";
  services.ollama.environmentVariables = {
    OLLAMA_HOST = "0.0.0.0:11434";
    OLLAMA_ORIGINS = "*"; # Necesario si vas a usar web UIs externas
  };

  # Tailscale
  services.tailscale =
    {
      enable = true;
      useRoutingFeatures = "both";

    };



      # One Drive support
      # services.onedrive.enable = true;
      # Comentario de prueba

      # Configure keymap in X11
      services.xserver.xkb = {
  layout = "us";
  variant = "";
};

# Enable CUPS to print documents.
services.printing.enable = true;

# Enable sound with pipewire.
services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
enable = true;
alsa.enable = true;
alsa.support32Bit = true;
pulse.enable = true;
# If you want to use JACK applications, uncomment this
jack.enable = true;

# use the example session manager (no others are packaged yet so this is enabled by default,
# no need to redefine it in your config for now)
#media-session.enable = true;
};


# Polkit para hyperland

security.polkit.enable = true;




programs.nix-ld.enable = true;




# Enable touchpad support (enabled default in most desktopManager).
services.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.arroio = {
isNormalUser = true;
description = "arroio";
extraGroups = [ "networkmanager" "wheel" "video" "render" "docker" ];
packages = with pkgs; [
kdePackages.kate
#  thunderbird
];
};

# Install firefox.
programs.firefox.enable = true;
programs.coolercontrol.enable = true;




home-manager = {
extraSpecialArgs = { inherit inputs; };
users = {
"arroio" = import ./home.nix;
};
};


# List packages installed in system profile. To search, run:
# $ nix search wget
environment.systemPackages = with pkgs; [
#  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
#  wget
nerd-fonts.fantasque-sans-mono
nerd-fonts.jetbrains-mono
nerd-fonts.iosevka-term
nerd-fonts.monoid
nerd-fonts.fira-code
lmodern

# Stuff para dataspell
stdenv.cc.cc.lib

];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;


fonts.fontconfig.enable = true;
fonts.packages = with pkgs;[
nerd-fonts.fantasque-sans-mono
nerd-fonts.jetbrains-mono
nerd-fonts.iosevka-term
nerd-fonts.monoid
nerd-fonts.fira-code
nerd-fonts.victor-mono
nerd-fonts.blex-mono


ibm-plex
noto-fonts
noto-fonts

];


# Env variables

# For Dataspell
# environment.variables.LD_LIBRARY_PATH = "${pkgs.gcc.cc.lib}/lib";
environment.variables = {

# cupy / cuda  
CUDA_PATH = "${pkgs.cudatoolkit}";
LD_LIBRARY_PATH = lib.mkForce "/run/opengl-driver/lib:${pkgs.cudaPackages.cuda_nvrtc}/lib:${pkgs.cudaPackages.cudatoolkit}/lib";

};





# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
system.stateVersion = "25.05"; # Did you read the comment?


boot.extraModprobeConfig = ''
    options snd_hda_intel power_save=0
  '';





}
