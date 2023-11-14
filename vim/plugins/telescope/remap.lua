local builtin = require 'telescope.builtin'
local themes = require 'telescope.themes'

vim.keymap.set("n", "<leader>%", function()
  vim.cmd('vsplit')
  builtin.find_files(themes.get_dropdown(opts))
end)
vim.keymap.set("n", '<leader>"', function()
  vim.cmd('split')
  builtin.find_files(themes.get_dropdown(opts))
end)

vim.keymap.set("n", "<leader>F", function() builtin.live_grep(themes.get_dropdown(opts)) end, {})
vim.keymap.set('n', '<leader>f', function() builtin.find_files(themes.get_dropdown(opts)) end, {})
