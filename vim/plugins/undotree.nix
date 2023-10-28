{ config, user, host, pkgs, ... }:

{
  programs.nixvim = {
    plugins.undotree = {
      enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>u";
        action = "<cmd>UndoTreeToggle<cr>";
      }
    ];
  };
}
