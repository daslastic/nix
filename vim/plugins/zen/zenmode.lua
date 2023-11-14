local zenmode = require "zen-mode"

zenmode.opts = {
  window = {
    backdrop = 1,
    width = 120,
    options = {
      signcolumn = "no",
      number = false,
      relativenumber = false,
      cursorline = true,
      cursorcolumn = false, -- disable cursor column
    },
  },
}

vim.keymap.set("n", "<leader>z", ":ZenMode<cr>")
