require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Set indentation defaults: always use spaces, 2-width indents
local opt = vim.opt
opt.expandtab = true      -- convert TAB to spaces
opt.shiftwidth = 2        -- size of an indent during >> or auto-indent
opt.tabstop = 2           -- how many spaces a literal <Tab> represents
opt.softtabstop = 2       -- how many spaces <Tab>/<BS> operate on in insert mode
