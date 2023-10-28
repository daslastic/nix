{ config, user, host, pkgs, ... }:

{
  imports =
    [
      ./remap.nix
      ./opt.nix
      ./plugins
    ];

  programs = {
    nixvim = {
      enable = true;

      colorschemes.gruvbox = {
        enable = true;
      };
    };
  };
}
