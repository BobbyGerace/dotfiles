indentscope = require('mini.indentscope')

indentscope.setup({
  draw = { animation = indentscope.gen_animation.none() }
})

-- Change color of the indentscope symbol
vim.cmd('highlight link MiniIndentscopeSymbol Comment')
