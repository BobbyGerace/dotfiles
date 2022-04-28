local map = require('util').map

require('nvim-tree').setup{
  hijack_cursor = true,
  update_focused_file = {
    enable = true
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  git = {
    ignore = false
  },
  view = {
    width = 40
  }
}

-- enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_git_hl = 1
-- enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_highlight_opened_files = 1 

map('n', '<leader>tt', ':NvimTreeFindFileToggle<cr>', 'toggle tree')
map('n', '<leader>tr', ':NvimTreeRefresh<cr>', 'refresh tree')
map('n', '<leader>t=', ':NvimTreeResize +10<cr>', 'make tree wider')
map('n', '<leader>t-', ':NvimTreeResize -10<cr>', 'make tree narrower')
