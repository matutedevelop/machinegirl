{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyperland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Spicetify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";


    # Zen
    zen-browser.url = "github:youwen5/zen-browser-flake/5f8f1af9d29c59175e95937f14e0c4ba6418f2cb";

    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    nixosConfigurations.arroio = nixpkgs.lib.nixosSystem {

      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.home-manager

        {
          nixpkgs.config.allowUnfree = true;
        }

      ];

    };
  };
}
