{
  description = "daslastic's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    impermanence.url = "github:nix-community/impermanence";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    self,
    ...
  }: let
  forAllSystems = function: nixpkgs.lib.genAttrs ["x86_64-linux"] (system: function nixpkgs.legacyPackages.${system});
    commonInherits = {
    inherit (nixpkgs) lib;
    inherit self inputs nixpkgs;
    user = "daslastic";
    system = "x86_64-linux";
  }; in {
    nixosConfigurations = import ./hosts (commonInherits // {isNixOS = true;});
    inherit self;
  };
}
