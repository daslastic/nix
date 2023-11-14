{ config, user, host, pkgs, ... }:

{
  programs.nixvim = {
    extraConfigLua = builtins.readFile ./remap.lua;
  };
}
