{ config, user, host, pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      zen-mode-nvim
    ];
    extraConfigLuaPost = builtins.readFile ./zenmode.lua;
  };
}
