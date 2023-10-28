{
  inputs,
  lib,
  self,
  user,
  nixpkgs,
  ...
}: let
  mkHost = host: let
    extraSpecialArgs = {
      inherit self inputs host user nixpkgs;
    };
  in
    lib.nixosSystem {
      specialArgs = extraSpecialArgs;

      modules =
        [
          ../nixos
          ../vim
          ./global.nix
          ./nix.nix
          ./${host}
          ./${host}/hardware.nix

          inputs.home-manager.nixosModules.home-manager
          inputs.nixvim.nixosModules.nixvim

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              inherit extraSpecialArgs;

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

          (lib.mkAliasOptionModule ["hm"] ["home-manager" "users" user])
          inputs.impermanence.nixosModules.impermanence
        ];
    };
in {
  server = mkHost "server";
}
