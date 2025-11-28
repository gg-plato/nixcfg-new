{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    catppuccin.url = "github:catppuccin/nix";
    cosmic-unstable.url = "github:ninelore/nixpkgs-cosmic-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      # nixpkgs-stable,
      home-manager,
      nixos-hardware,
      nix-flatpak,
      cosmic-unstable,
      catppuccin,
      ...
    }@inputs:
    {

      nixosConfigurations.shard = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # specialArgs = {
        #   inherit inputs;
        # };

        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen4
          {
            nix.settings = {
              substituters = [ "https://9lore.cachix.org/" ];
              trusted-public-keys = [ "9lore.cachix.org-1:H2/a1Wlm7VJRfJNNvFbxtLQPYswP3KzXwSI5ROgzGII=" ];
            };
          }
          cosmic-unstable.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.greg.imports = [
              ./home/home.nix
              nix-flatpak.homeManagerModules.nix-flatpak
              catppuccin.homeModules.catppuccin
            ];
          }
        ];
      };
    };

}
