{ config, user, host, pkgs, ... }:

{
  imports =
    [
      ./impermanence.nix
      ./settings.nix
      ./zfs.nix
    ];

  environment = {
    variables = {
      NIXPKGS_ALLOW_UNFREE = "1";
    };
    systemPackages = with pkgs; [
      curl
      eza
      killall
      ripgrep
      tree
      wget
      gzip
      killall
      rar
      ripgrep
      wget
      home-manager
    ];
  };

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  system.stateVersion = "23.05";
}
