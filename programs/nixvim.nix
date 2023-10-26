{ config, user, host, pkgs, ... }:

{
  programs = {
    nixvim = {
      enable = true;
      colorschemes.gruvbox = {
        enable = true;
      };
      globals.mapleader = " ";

      keymaps = [
        {
          mode = "n";
          key = "<leader>e";
          action = "<cmd>Ex<cr>";
        }
        {
          mode = "n";
          key = "<leader>q";
          action = "<cmd>qa!<cr>";
        }
      ];

      options = {
        backup = false;
        clipboard = "unnamedplus";
        cmdheight = 1;
        guicursor = "";
        conceallevel = 0;
        fileencoding = "utf-8";
        ignorecase = true;
        mouse = "a";
        pumheight = 10;
        showmode = false;
        showtabline = 0;
        smartcase = true;
        smartindent = true;
        splitbelow = true;
        splitright = true;
        swapfile = false;
        termguicolors = true;
        timeoutlen = 1000;
        updatetime = 50;
        writebackup = false;
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
        cursorline = true;
        number = true;
        laststatus = 3;
        showcmd = false;
        ruler = false;
        relativenumber = true;
        numberwidth = 2;
        signcolumn = "yes";
        wrap = false;
        scrolloff = 8;
        sidescrolloff = 8;
        guifont = "monospace:h17";
        title = true;
        undofile = true;
        hlsearch = false;
        incsearch = true;
      };

      plugins = {
        lualine.enable = true;
      };

    };
  };
}
