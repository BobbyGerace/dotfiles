local map = require('util').map

require('aerial').setup({
  backends = {'lsp'},
  filter_kind = false,
  close_on_select = true,
  max_width = nil,
  min_width = nil,
  width = 40,
  show_guides = true
})

map('n', '<leader>o', '<cmd>AerialToggle<cr>', 'open symbol outline')
