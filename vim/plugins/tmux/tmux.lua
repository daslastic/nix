local tmux = require("tmux")

tmux.setup({
  resize = {
    enable_default_keybindings = false,
    resize_step_x = 2,
    resize_step_y = 2,
  }
})

vim.keymap.set("n", "<C-Up>", '<cmd>lua tmux.resize_top()<cr>')
vim.keymap.set("n", "<C-Down>", '<cmd>lua tmux.resize_bottom()<cr>')
vim.keymap.set("n", "<C-Left>", '<cmd>lua tmux.resize_left()<cr>')
vim.keymap.set("n", "<C-Right>", '<cmd>lua tmux.resize_right()<cr>')
