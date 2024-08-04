-- vim.opt behaves like "set"
local o = vim.opt
local g = vim.g

g.mapleader = ' ' -- use the spacebar as leader key
o.completeopt = 'menu,menuone,noselect'
o.signcolumn = 'yes'
o.number = true -- show line numbers
o.ignorecase = true -- ignore case when searching
o.smartcase = true -- unless the search has a capital letter

-- highlight the number of the current line
o.cursorline = true
o.cursorlineopt = 'number'

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

-- global statusline
o.laststatus = 3

-- time after typing to update plugins
o.updatetime = 750

o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99

-- if git wants to open an editor, do it in this nvim instance
vim.cmd [[
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
]]
