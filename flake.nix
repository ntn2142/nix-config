{
  description = "nixos configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }:
    let
      lib = nixpkgs.lib;

      homeNixosConfiguration = username: [
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = {
            imports = [ ./home-manager/${username}.nix ];
          };
        }
      ];

      ifPathExists = path: lib.optional (lib.pathExists path) path;

      mkSingleNixosConfig =
        {
          hostname,
          username,
          modules ? [ ],
        }:
        lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            {
              system.stateVersion = "25.05";
              networking.hostName = hostname;
            }
            ./nixos/hardware/${hostname}.nix
            # ./nixos/${hostname}.nix
          ]
          ++ (homeNixosConfiguration username)
          ++ ifPathExists ./nixos/${hostname}.nix
          ++ modules;
        };

      mkNixosConfigurations =
        config_list:
        let
          processElem =
            elem@{ hostname, ... }: lib.attrsets.nameValuePair hostname (mkSingleNixosConfig elem);
          finalConfigList = lib.lists.forEach config_list processElem;

        in
        builtins.listToAttrs finalConfigList;
    in
    {
      nixosConfigurations = mkNixosConfigurations [
        {
          hostname = "annix";
          username = "ntn2142";
          modules = [
            ./nixos/default.nix
            ./nixos/locale_timezone_de.nix
            ./nixos/kde_plasma.nix
            ./nixos/programs.nix
            ./nixos/user_ntn2142.nix
          ];
        }
        {
          hostname = "hpenix";
          username = "ntn2142";
          modules = [
            ./nixos/default.nix
            ./nixos/locale_timezone_de.nix
            ./nixos/kde_plasma.nix
            ./nixos/programs.nix
            ./nixos/user_ntn2142.nix
            ./nixos/nvidia.nix
            ./nixos/nvidia_optimus.nix
          ];

        }
      ];

    };
}
