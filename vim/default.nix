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
      trueColor = true;
      contrastDark = "hard";
      bold = true;
      italics = true;
      transparentBg = true;
      improvedWarnings = true;
      improvedStrings = true;
    }; # working???

    extraConfigLua = ''
      require("gruvbox").setup({
          transparent_mode = true,
      })

      vim.cmd.colorscheme("gruvbox")
    '';
  };
}
