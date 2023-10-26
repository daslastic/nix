{
  inputs,
  lib,
  self,
  user,
  ...
}: let
  mkHost = host: let
    extraSpecialArgs = {
      inherit self inputs host user;
    };
  in
    lib.nixosSystem {
      specialArgs = extraSpecialArgs;

      modules =
        [
          ./common.nix
          ./${host}
          ./${host}/hardware.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              inherit extraSpecialArgs;

              users.${user} = {
                imports = [
                  inputs.nix-index-database.hmModules.nix-index
                  inputs.impermanence.nixosModules.home-manager.impermanence
                  ./${host}/home.nix
                  ./home-manager.nix
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
