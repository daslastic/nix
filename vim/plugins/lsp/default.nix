{ config, user, host, pkgs, ... }:

{
  programs.nixvim  = {
    plugins = { 
      lsp = {
        enable = true;
        servers = {
          clangd.enable = true;
          rnix-lsp.enable = true;
          pyright.enable = true;
          rust-analyzer.enable = true;
          html.enable = true;
          cssls.enable = true;
          jsonls.enable = true;
          eslint.enable = true;
          tsserver.enable = true;
          vuels.enable = true;
          svelte.enable = true;
          elixirls.enable = true;
        };
      };

      nix.enable = true;
      comment-nvim.enable = true;
      luasnip.enable = true;

      nvim-cmp = { 
        enable = true;
      };

      cmp-nvim-lsp.enable = true;
      cmp-nvim-lua.enable = true;
      cmp-path.enable = true;
      cmp-tmux.enable = true;
      cmp-emoji.enable = true;
      cmp-vsnip.enable = true;
      cmp-fish.enable = true;
      cmp_luasnip.enable = true;
      emmet.enable = true;

      none-ls = {
        enable = true;
        sources.formatting = {
          prettier.enable = true;
        };
      };

      #nvim-jdtls.enable = true;
      rust-tools.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      neodev-nvim
      friendly-snippets
      lsp_signature-nvim
    ];

    extraConfigLuaPre = builtins.readFile ./neodev.lua;
    extraConfigLuaPost = builtins.readFile ./lsp.lua;
  };
}
