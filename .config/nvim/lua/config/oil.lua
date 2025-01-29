local map = require('util').map

require('oil').setup({
  view_options = {
    show_hidden = true,
  }
})

map('n', '<leader>tt', ':Oil<CR>', 'file explorer')
