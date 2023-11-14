{ config, user, host, pkgs, ... }:

{
  imports =
    [
      ./lsp
      ./inlayhints
      ./tmux
      ./telescope
      ./lualine.nix
      ./undotree.nix
      ./zen
    ];
}
