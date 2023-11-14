{
  pkgs,
  nixpkgs,
  ...
}: {
  nix = {
    nixPath = ["nixpkgs=flake:nixpkgs"];
    registry.nixpkgs.flake = nixpkgs;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable;
  };

  programs = {
    command-not-found.enable = false;
    nix-index.enable = false;
  };

  nixpkgs.config.allowUnfree = true;
}
