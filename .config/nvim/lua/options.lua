-- vim.opt behaves like "set"
local o = vim.opt
local g = vim.g

g.mapleader = ' ' -- use the spacebar as leader key
o.completeopt = 'menu,menuone,noselect'
o.signcolumn = 'number' -- put signs in the number column
o.number = true -- show line numbers
o.ignorecase = true -- ignore case when searching
o.smartcase = true -- unless the search has a capital letter

-- 2 spaces instead of tabs
o.tabstop = 2 
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true

-- enable the mouse
o.mouse = 'a'

-- splits should automatically open right or below 
o.splitbelow = true 
o.splitright = true

-- use ripgrep
o.grepprg = 'rg --vimgrep --no-heading'
o.grepformat = '%f:%l:%c:%m,%f:%l:%m'

-- true colors
o.termguicolors = true

-- I don't totally understand this, but should improve perf
g.do_filetype_lua = 1
g.did_load_filetypes = 0

-- global statusline
o.laststatus = 3

-- time after typing to update plugins
o.updatetime = 750

-- when using the tokyonight theme
g.tokyonight_style = 'night'
vim.cmd('colorscheme rose-pine')
