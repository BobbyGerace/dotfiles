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

-- enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_git_hl = 1
-- enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_highlight_opened_files = 1 

map('n', '<leader>tt', ':NvimTreeFindFileToggle<cr>', 'toggle tree')
map('n', '<leader>tr', ':NvimTreeRefresh<cr>', 'refresh tree')
