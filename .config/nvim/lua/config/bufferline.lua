local map = require('util').map

require('bufferline').setup{
  options = {
    separator_style = 'slant',
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

map('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', 'go to buffer 1')
map('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', 'go to buffer 2')
map('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', 'go to buffer 3')
map('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', 'go to buffer 4')
map('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', 'go to buffer 5')
map('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', 'go to buffer 6')
map('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', 'go to buffer 7')
map('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', 'go to buffer 8')
map('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', 'go to buffer 9')
