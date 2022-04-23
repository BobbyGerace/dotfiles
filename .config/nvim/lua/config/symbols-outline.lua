local map = require('util').map

vim.g.symbols_outline = {
    width = 20,
    auto_close = true,
}

map('n', '<leader>o', ':SymbolsOutline<CR>')

