local map = require('util').map

require('Comment').setup {
  ignore = '^%s*$' -- ignore empty lines
}

map('n', '<c-_>', '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$', 'comment line')
map('x', '<c-_>', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', 'comment line')
