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
      inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = inputs @ {
    nixpkgs,
    self,
    nixpkgs-stable,
    ...
  }:
  let
    system = "x86_64-linux";
    forAllSystems = function: nixpkgs.lib.genAttrs ["x86_64-linux"] (system: function nixpkgs.legacyPackages.${system});
      commonInherits = {
      inherit (nixpkgs) lib;
      inherit self inputs nixpkgs nixpkgs-stable system;
      user = "daslastic";
    };
  in {
    nixosConfigurations = import ./hosts (commonInherits // {isNixOS = true;});
    inherit self;
  };
}
