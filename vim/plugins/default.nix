{ config, user, host, pkgs, ... }:

{
  imports =
    [
      ./lsp
      ./tmux
      ./telescope
      ./lualine.nix
      ./undotree.nix
    ];
}
