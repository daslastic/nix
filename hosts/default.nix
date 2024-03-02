{
  inputs,
  self,
  user,
  lib,
  nixpkgs,
  nixpkgs-stable,
  system,
  ...
}: let
  mkHost = host: let
    extraSpecialArgs = {
      inherit self inputs host user nixpkgs;
    };
    overlay-lemon = final: prev: {
      lemon = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    };
  in lib.nixosSystem {
    specialArgs = extraSpecialArgs;
    modules =
      [
        ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-lemon ]; })
        inputs.home-manager.nixosModules.home-manager
        inputs.impermanence.nixosModules.impermanence
        # inputs.nixvim.nixosModules.nixvim
        ../nixos
        # ../vim
        ./global.nix
        ./nix.nix
        ./${host}/gaming-mode.nix
        ./${host}
        ./${host}/hardware.nix
        {
          home-manager = {
            inherit extraSpecialArgs;

            useGlobalPkgs = true;
            useUserPackages = true;

            users.${user} = {
              imports = [
                inputs.impermanence.nixosModules.home-manager.impermanence
                ./${host}/home.nix
                ../home
              ];

              programs.home-manager.enable = true;
            };
          };
        }
      ];
  };
in {
  notflix = mkHost "notflix";
}
