local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- Run Prettier (or Prettierd if available) for common web filetypes
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettier" },
    css = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },

  -- Fallback to any attached LSP formatter when no dedicated formatter is configured
  default_format_opts = {
    lsp_format = "fallback",
  },
}

return options
