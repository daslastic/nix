{
  inputs,
  self,
  user,
  lib,
  nixpkgs,
  ...
}: let
  mkHost = host: let
    extraSpecialArgs = {
      inherit self inputs host user nixpkgs;
    };
  in lib.nixosSystem {
    specialArgs = extraSpecialArgs;
    modules =
      [
        inputs.home-manager.nixosModules.home-manager
        inputs.impermanence.nixosModules.impermanence
        inputs.nixvim.nixosModules.nixvim
        ../nixos
        ../vim
        ./global.nix
        ./nix.nix
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
