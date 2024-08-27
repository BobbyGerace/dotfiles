local map = require('util').map

local grapple = require('grapple')

grapple.setup {
  scope = 'git',
}

map('n', '<leader>m', '<cmd>Grapple toggle<cr>', 'Grapple toggle tag')
map('n', '<leader>j', '<cmd>Grapple toggle_tags<cr>', 'Grapple open')

