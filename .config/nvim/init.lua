vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  -- -- Mason.nvim setup (for installing language servers)
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
    config = function()
      require("mason").setup {
        ui = {
          border = "rounded",
        },
      }
    end,
  },
  -- Mason-LSPConfig.nvim (for bridging Mason installs to lspconfig)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      print("hello from mason-lspconfig config block!") -- Add this line
      require("mason-lspconfig").setup {
        ensure_installed = {
          "typescript-language-server", -- Correct Mason package name for TypeScript
          "tailwindcss-language-server", -- Correct Mason package name for Tailwind CSS
          "svelte-language-server",     -- Correct Mason package name for Svelte LSP
          "css-lsp",                    -- Correct Mason package name for CSS LSP
          "html-lsp",                   -- Correct Mason package name for HTML LSP
        },
      }
      -- IMPORTANT: Removed on_ready. We will manually set up LSP clients below.
    end,
  },
  -- -- nvim-lspconfig (for setting up LSP clients)
  -- -- This is where we explicitly tell lspconfig to enable each server.
  -- {
  --   "neovim/nvim-lspconfig",
  --   lazy = false,
  --   config = function()
  --     print("LSP config block loaded!") -- Add this line
  --     local lspconfig = require "lspconfig"

  --     -- Explicitly set up each language server that Mason installs
  --     lspconfig.tsserver.setup {}          -- Handles TypeScript and JavaScript
  --     lspconfig.tailwindcss.setup {}       -- Handles Tailwind CSS in various files
  --     lspconfig.svelte.setup {}            -- Handles Svelte files
  --     lspconfig.cssls.setup {}             -- Handles CSS, SCSS, Less
  --     lspconfig.html.setup {}              -- Handles HTML and templ files

  --     -- Lua LSP configuration (often included in NvChad's defaults, but explicit here)
  --     lspconfig.lua_ls.setup {
  --       settings = {
  --         Lua = {
  --           workspace = {
  --             -- Adjust this path if your NvChad's lua_ls library path differs
  --             library = vim.api.nvim_get_runtime_and_user_data_path() .. "/lazy/NvChad/lua/nvchad_types",
  --             checkThirdParty = false,
  --           },
  --           diagnostics = {
  --             globals = { "vim" },
  --           },
  --         },
  --       },
  --     }
  --   end
  -- },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "javascript", "typescript", "html", "css", "svelte" },
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        }
      }
    end
  },
  {
    import = "plugins"
  }
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)