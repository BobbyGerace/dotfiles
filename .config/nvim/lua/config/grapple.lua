local map = require('util').map

local grapple = require('grapple')

grapple.setup {
  scope = 'git',
}

map('n', '<leader>m', '<cmd>Grapple toggle<cr>', 'Grapple toggle tag')
map('n', '<leader>\'', '<cmd>Grapple toggle_tags<cr>', 'Grapple open')
map('n', '<leader>j', '<cmd>Grapple select index=1<cr>', 'Grapple open')
map('n', '<leader>k', '<cmd>Grapple select index=2<cr>', 'Grapple open')
map('n', '<leader>l', '<cmd>Grapple select index=3<cr>', 'Grapple open')
map('n', '<leader>;', '<cmd>Grapple select index=4<cr>', 'Grapple open')

