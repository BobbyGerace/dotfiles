local map = require('util').map

require('triptych').setup({
  options = { show_hidden = true },
})

map('n', '<leader>tt', ':Triptych<CR>', 'file explorer')
