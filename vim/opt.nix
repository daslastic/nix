{ config, user, host, pkgs, ... }:

{
  programs.nixvim.options = {
    backup = false;
    completeopt = [ "menuone" "noselect" ];
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
}
