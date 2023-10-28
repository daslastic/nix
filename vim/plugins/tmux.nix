{ config, user, host, pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      tmux-nvim
    ];

    keymaps = [
      {
        mode = "n";
        key = "<C-Up>";
        action = "<cmd>lua require(\"tmux\").resize_top()<cr>";
      }
      {
        mode = "n";
        key = "<C-Down>";
        action = "<cmd>lua require(\"tmux\").resize_bottom()<cr>";
      }
      {
        mode = "n";
        key = "<C-Left>";
        action = "<cmd>lua require(\"tmux\").resize_left()<cr>";
      }
      {
        mode = "n";
        key = "<C-Right>";
        action = "<cmd>lua require(\"tmux\").resize_right()<cr>";
      }
    ];

    extraConfigLua = ''
      require("tmux").setup({
        resize = {
          enable_default_keybindings = false,
          resize_step_x = 2,
          resize_step_y = 2,
        }
      })
    '';
  };
}
