local map = require('util').map

require('nvim-tree').setup{
  update_focused_file = {
    enable = true
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
}

local g = vim.g

g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.

-- Toggle nerd tree
map('n', '<leader>tt', ':NvimTreeFindFileToggle<cr>')
-- Reload the file list
map('n', '<leader>tr', ':NvimTreeRefresh<cr>')
