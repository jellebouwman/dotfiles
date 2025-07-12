-- First, load NvChad's default LSP config so that cmp, keymaps etc. are set up
local nvchad_lsp = require("nvchad.configs.lspconfig")

nvchad_lsp.defaults()

-- Use the on_attach & capabilities that NvChad exposes
local on_attach = nvchad_lsp.on_attach
local capabilities = nvchad_lsp.capabilities

local lspconfig = require "lspconfig"

-- List of language servers to enable. Mason will ensure they're installed automatically
local servers = { "html", "cssls", "tailwindcss", "svelte", "tsserver", "lua_ls" }

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- If you need per-server overrides, you can do it like so:
-- lspconfig.tailwindcss.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     tailwindCSS = {
--       experimental = {
--         classRegex = {
--           "tw`([^`]*)",
--           "tw\("([^\"]*)",
--         },
--       },
--     },
--   },
-- }

-- read :h vim.lsp.config for changing options of lsp servers
