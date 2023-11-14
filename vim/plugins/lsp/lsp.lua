local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = "LSP",
        emoji = "Emoji",
        path = "Path",
        vsnip = "Snippet",
        fish = "Fish";
        luasnip = "Snippet",
        buffer = "Buffer",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = cmp.config.sources({
    { name = "buffer" },
    { name = "path" },
    { name = "emoji" },
    { name = "fish" },
    --{ name = "crates" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }),
})

local M = {}

M.keymaps = function(bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
  vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "<leader>as", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set("n", "<leader>aa", function()
    vim.lsp.buf.code_action()
  end, opts)
  vim.keymap.set("n", "<leader>ad", function()
    vim.lsp.buf.references()
  end, opts)
  vim.keymap.set("n", "<leader>ar", function()
    vim.lsp.buf.rename()
  end, opts)
  vim.keymap.set("n", "<leader>af", function()
    vim.lsp.buf.format({ async = false })
  end, opts)
  vim.keymap.set("n", "<leader>aj", function()
    vim.diagnostic.goto_next()
  end, opts)
  vim.keymap.set("n", "<leader>ak", function()
    vim.diagnostic.goto_prev()
  end, opts)

  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
    vim.lsp.buf.hover()
  end, opts)

  vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
  end, opts)
end

M.on_attach = function(_, bufnr)
  M.keymaps(bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer" })

  local lsp_signature = require("lsp_signature")
  lsp_signature.on_attach({
    bind = true,
    floating_window_above_cur_line = true,
    handler_opts = {
      border = "none",
    },
  }, bufnr)
end
