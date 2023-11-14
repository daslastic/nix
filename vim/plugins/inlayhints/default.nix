{ config, user, host, pkgs, ... }:

{
  programs.nixvim  = {
    extraPlugins = with pkgs.vimPlugins; [
      lsp-inlayhints-nvim
    ];

    extraConfigLuaPost = builtins.readFile ./inlayhints.lua;
  };
}
