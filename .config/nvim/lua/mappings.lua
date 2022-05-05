local map = require('util').map

map(
  'n',
  '<leader>R',
  ':cfdo %s///g | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>',
  'replace in project (from qf)'
)

map('n', '<leader>r', ':%s///g<Left><Left>', 'replace in current file')

map(
  'n',
  '<leader>Rc',
  ':cfdo %s///gc | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>',
  'replace in project with confirm',
  { silent = false }
)

map('n', '<leader>rc', ':%s///gc<Left><Left><Left>', 'replace in current file with confirm')

map('n', '<leader><tab>', ':b#<CR>', 'previous file')

map('x', 'Y', '"*y', 'copy to clipboard')

map('n', 'P', '"*p', 'paste from clipboard')

map('n', '<leader>qt', ':tabclose<CR>', 'quit/close tab')

map('n', '<esc>', ':noh<cr>', 'clear highlights')

map('n', '<leader>x', ':bp<bar>sp<bar>bn<bar>bd<CR>', 'close buffer')

-- These are off because the conflict with the tmux extension
-- map('n', '<c-k>', ':wincmd k<CR>', 'switch to upper split')
-- map('n', '<c-j>', ':wincmd j<CR>', 'switch to lower split')
-- map('n', '<c-h>', ':wincmd h<CR>', 'switch to left split')
-- map('n', '<c-l>', ':wincmd l<CR>', 'switch to right split')

-- Switch to window from terminal
map('t', '<c-k>', '<c-\\><c-n>:wincmd k<CR>', 'switch to upper split (terminal)')
map('t', '<c-j>', '<c-\\><c-n>:wincmd j<CR>', 'switch to lower split (terminal)')
map('t', '<c-h>', '<c-\\><c-n>:wincmd h<CR>', 'switch to left split (terminal)')
map('t', '<c-l>', '<c-\\><c-n>:wincmd l<CR>', 'switch to right split (terminal)')

-- Swap window
map('n', '<leader>wk', ':wincmd K<CR>', 'swap window to upper')
map('n', '<leader>wj', ':wincmd J<CR>', 'swap window to lower')
map('n', '<leader>wh', ':wincmd H<CR>', 'swap window to left')
map('n', '<leader>wl', ':wincmd L<CR>', 'swap window to right')

-- Resize window
map('n', '<Leader>=', ':exe "resize " . (winheight(0) * 3/2)<CR>', 'make split bigger')
map('n', '<Leader>-', ':exe "resize " . (winheight(0) * 2/3)<CR>', 'make split smaller')

-- I accidentally open the command history buffer with this all the time
map('n', 'q:', '<nop>', nil, { noremap = false })
