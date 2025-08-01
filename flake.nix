{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyperland.url = "github:hyprwm/Hyprland";

    plugin-lazy-nix-helper.url = "github:b-src/lazy-nix-helper.nvim";
    plugin-lazy-nix-helper.flake = false;



    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
