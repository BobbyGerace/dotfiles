local map = require('util').map

-- replace in project (after getting to quickfix window)
map('n','<leader>R', ':cfdo %s///g | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>')
-- replace in current file
map('n','<leader>r', ':%s///g<Left><Left>')
-- replace in project with confirm (after getting to quickfix window)
map('n','<leader>Rc', ':cfdo %s///gc | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>')
-- replace in current file with confirm
map('n','<leader>rc', ':%s///gc<Left><Left><Left>')
-- Flip to previous file
map('n', '<leader><tab>', ':b#<CR>')
-- Copy to clipboard in visual mode
map('v', '<leader>y', '"*y')
-- Paste from clipboard
map('n', '<leader>v', '"*p')
-- Close tab
map('n', '<leader>qt', ':tabclose<CR>')
-- clear highlights on esc
map('n', '<esc>', ':noh<cr>')
-- close buffer without closing window
map('n', '<leader>qb', ':bp<bar>sp<bar>bn<bar>bd<CR>')

-- Switch to window 
map('n', '<c-k>', ':wincmd k<CR>')
map('n', '<c-j>', ':wincmd j<CR>')
map('n', '<c-h>', ':wincmd h<CR>')
map('n', '<c-l>', ':wincmd l<CR>')

-- Switch to window from terminal
map('t', '<c-k>', '<c-\\><c-n>:wincmd k<CR>')
map('t', '<c-j>', '<c-\\><c-n>:wincmd j<CR>')
map('t', '<c-h>', '<c-\\><c-n>:wincmd h<CR>')
map('t', '<c-l>', '<c-\\><c-n>:wincmd l<CR>')

-- Swap window
map('n', '<leader>wk', ':wincmd K<CR>')
map('n', '<leader>wj', ':wincmd J<CR>')
map('n', '<leader>wh', ':wincmd H<CR>')
map('n', '<leader>wl', ':wincmd L<CR>')

-- Resize window
map('n', '<Leader>=', ':exe "resize " . (winheight(0) * 3/2)<CR>')
map('n', '<Leader>-', ':exe "resize " . (winheight(0) * 2/3)<CR>')

