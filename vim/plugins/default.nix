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

  programs.nixvim = {
    plugins = {
      fidget.enable = true;
      treesitter = {
        enable = true;
        nixGrammars = true;
        ensureInstalled = "all";
      };

      nvim-autopairs.enable = true;
      ts-autotag.enable = true;
      nvim-colorizer.enable = true;
    };
  };
}
