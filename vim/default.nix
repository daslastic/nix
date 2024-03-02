{ config, user, host, pkgs, ... }:
{
  imports =
    [
      ./remap.nix
      ./opt.nix
      ./plugins
    ];

  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox = {
      enable = true;
    }; # working???

    extraConfigLua = ''
      require("gruvbox").setup({
          transparent_mode = true,
      })

      vim.cmd.colorscheme("gruvbox")
    '';
  };
}
