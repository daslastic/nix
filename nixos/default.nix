{ config, user, host, pkgs, ... }:

{
  imports =
    [
      ./impermanence.nix
      ./settings.nix
      ./zfs.nix
      ./river.nix
    ];

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
