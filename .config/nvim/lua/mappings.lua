require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>fd", ":Telescope diagnostics<CR>", { desc = "Find diagnostics" })

map("n", "<leader>s", function()
  require("conform").format { async = false, lsp_format = "fallback" } -- Format first with Conform
  vim.cmd "write"                      -- Then save
end, { desc = "Format and save" })

-- Explicit Prettier command and keymap
vim.api.nvim_create_user_command("Prettier", function()
  require("conform").format { formatters = { "prettier" }, async = false }
end, {})

map("n", "<leader>p", ":Prettier<CR>", { desc = "Format with Prettier" })
