local map = require('util').map
local highlights = require('rose-pine.plugins.bufferline')

require('bufferline').setup{
  highlights = highlights,
  options = {
    separator_style = 'thick',
    max_name_length = 30,
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
}

map('n', '[b', ':BufferLineCyclePrev<CR>', 'previous tab')
map('n', ']b', ':BufferLineCycleNext<CR>', 'next tab')

map('n', '<leader>[b', ':BufferLineMovePrev<CR>', 'move tab left')
map('n', '<leader>]b', ':BufferLineMoveNext<CR>', 'move tab right')

map('n', 'gb', ':BufferLinePick<CR>', 'select a tab')

map('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>')
map('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>')
map('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>')
map('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>')
map('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>')
map('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>')
map('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>')
map('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>')
map('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>')
