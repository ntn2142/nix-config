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
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      homeConfigurations = {
        ntn2142 = {
          imports = [ ./home-manager/ntn2142.nix ];
        };
      };
      homeNixosConfiguration = user: [
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = homeConfigurations.${user};
        }
      ];
      mkSingleNixosConfig =
        { hostname, username }:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            {
              system.stateVersion = "25.05";
            }
            ./nixos/hardware/${hostname}.nix
            ./nixos/${hostname}.nix
            ./nixos/locale_timezone.nix.nix
          ] ++ homeNixosConfiguration username;
        };
      mkConfigNameValuePair =
        elem@{ hostname, username }:
        let
          nvPair = nixpkgs.lib.list.nameValuePair;
          config = nixpkgs.lib.nixosSystem mkSingleNixosConfig elem;
        in
        nvPair hostname config;

      mkNixosConfigurations =
        config_list:
        let
          processElem =
            elem@{ username, hostname }: nixpkgs.lib.attrs.nameValuePair hostname (mkSingleNixosConfig elem);
          finalConfigList = nixpkgs.lib.losts.forEach config_list processElem;

        in
        builtins.listToAttrs finalConfigList;
      tmp = mkNixosConfigurations [
        {
          hostname = "hpenix";
          username = "ntn2142";
        }
      ];
    in
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
            ./nixos/locale_timezone.nix.nix
          ] ++ homeNixosConfiguration "ntn2142";
        };
        annix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            {
              system.stateVersion = "25.05";
            }
            ./nixos/annix.nix
            ./nixos/locale_timezone.nix.nix
            ./nixos/hardware/annix.nix
          ] ++ homeNixosConfiguration "ntn2142";
        };
      };

    };
}
