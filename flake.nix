{
  description = "nixos configuration";
  inputs = rec {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    {
      nixosConfigurations = {
        hpenix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            {
              system.stateVersion = "25.05";
            }
            ./nixos/hardware/hpenix.nix
            ./nixos/hpenix.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ntn2142 = ./home-manager/ntn2142.nix;
            }
          ];
        };
        annix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            {
              system.stateVersion = "25.05";
            }
            ./nixos/annix.nix
            # ./nixos/hardware/annix.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ntn2142 = ./home-manager/ntn2142.nix;
            }
          ];
        };
      };

    };
}
