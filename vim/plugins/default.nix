{ config, user, host, pkgs, ... }:

{
  imports =
    [
      ./lualine.nix
      ./tmux.nix
      ./undotree.nix
      ./telescope.nix
    ];
}
