require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>fd", ":Telescope diagnostics<CR>", { desc = "Find diagnostics" })

map("n", "<leader>s", function()
  vim.lsp.buf.format { async = false } -- Format first
  vim.cmd "write"                      -- Then save
end, { desc = "Format and save" })
