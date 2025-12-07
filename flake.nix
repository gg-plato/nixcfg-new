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
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cosmic-unstable.url = "github:ninelore/nixpkgs-cosmic-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-hardware,
      nix-flatpak,
      cosmic-unstable,
      stylix,
      ...
    }@inputs:
    {

      nixosConfigurations.shard = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # specialArgs = {
        #   inherit inputs;
        # };

        modules = [
          {
            nix.settings = {
              extra-substituters = [ "https://9lore.cachix.org/" ];
              extra-trusted-public-keys = [ "9lore.cachix.org-1:H2/a1Wlm7VJRfJNNvFbxtLQPYswP3KzXwSI5ROgzGII=" ];
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
              stylix.homeModules.stylix
            ];
          }
          nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen4
          ./configuration.nix
        ];
      };
    };

}
