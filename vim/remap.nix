{ config, user, host, pkgs, ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";
    extraConfigLua = builtins.readFile ./remap.lua;
  };
}
