local map = require('util').map

require('aerial').setup({
  backends = {'lsp'},
  filter_kind = false,
  show_guides = true,
  layout = {
    max_width = nil,
    min_width = nil,
    width = 40,
  }
})

map('n', '<leader>o', '<cmd>AerialToggle<cr>', 'open symbol outline')
