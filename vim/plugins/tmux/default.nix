{ config, user, host, pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
    ];

    extraConfigLua = builtins.readFile ./tmux.lua;
  };
}
