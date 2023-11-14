{ config, user, host, pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      tmux-nvim
    ];

    extraConfigLua = builtins.readFile ./tmux.lua;
  };
}
