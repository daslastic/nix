{ config, user, host, pkgs, ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      # nice
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Ex<cr>";
      }
      {
        mode = "n";
        key = "<leader>x";
        action = "<cmd>qa!<cr>";
      }
      {
        mode = "n";
        key = "<leader>r";
        action = "<cmd>!chmod +x %<cr>";
        options = {
          silent = true;
        };
      }

      # split
      {
        mode = "n";
        key = "<leader>5";
        action = "<cmd>vsplit<cr><cmd>Ex<cr>";
      }

      {
        mode = "n";
        key = "<leader>'";
        action = "<cmd>split<cr><cmd>Ex<cr>";
      }


      # indent
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
      }
      {
        mode = "v";
        key = "K";
        action = ":m <-2<CR>gv=gv";
      }
      {
        mode = "v";
        key = "<S-h>";
        action = "<gv";
      }
      {
        mode = "v";
        key = "<S-l>";
        action = ">gv";
      }

      # paste
      {
        mode = "x";
        key = "<leader>p";
        action = "[[\"_dp]]";
      }
      {
        mode = [ "n" "v" ];
        key = "<leader>d";
        action = "[[\"_d]]";
      }

      # center
      {
        mode = "n";
        key = "J";
        action = "mzJ`z";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
      }
    ];
  };
}
