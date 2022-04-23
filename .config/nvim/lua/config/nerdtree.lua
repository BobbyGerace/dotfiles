local map = require('util').map

local g = vim.g

g.NERDTreeQuitOnOpen = 1
g.NERDTreeShowHidden=1

-- Toggle nerd tree
map('n', '<leader>tt', ':NERDTreeToggle<cr>')
-- Find current file in tree
map('n', '<leader>tf', ':NERDTreeFind<cr>')
-- Reload the file list
map('n', '<leader>tr', ':NERDTreeRefreshRoot<cr>')

