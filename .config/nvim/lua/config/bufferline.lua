local map = require('util').map

require('bufferline').setup{
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

-- unfortunately nightfox removed this from their repo, so I'll need to add it manually
if (vim.g._theme == 'nightfox') then
  vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "#131a24", fg = "#526176" })
  vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = "#192330", fg = "#d6d6d7" })
  vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { bg = "#131a24", fg = "#cdcecf" })
  vim.api.nvim_set_hl(0, "BufferLineCloseButton", { bg = "#131a24", fg = "#c94f6d" })
  vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", { bg = "#192330", fg = "#c94f6d" })
  vim.api.nvim_set_hl(0, "BufferLineCloseButtonVisible", { bg = "#131a24", fg = "#c94f6d" })
  vim.api.nvim_set_hl(0, "BufferLineError", { bg = "#c94f6d", fg = "#c94f6d" })
  vim.api.nvim_set_hl(0, "BufferLineErrorDiagnostic", { bg = "#c94f6d", fg = "#c94f6d" })
  vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#131a24" })
  vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = "#192330", fg = "#192330" })
  vim.api.nvim_set_hl(0, "BufferLineModified", { bg = "#131a24", fg = "#81b29a" })
  vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { bg = "#192330", fg = "#81b29a" })
  vim.api.nvim_set_hl(0, "BufferLineModifiedVisible", { bg = "#131a24", fg = "#81b29a" })
  vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = "#131a24", fg = "#719cd6" })
  vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { bg = "#192330", fg = "#719cd6" })
  vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", { bg = "#131a24", fg = "#719cd6" })
  vim.api.nvim_set_hl(0, "BufferLineTab", { bg = "#131a24", fg = "#29394e" })
  vim.api.nvim_set_hl(0, "BufferLineTabClose", { bg = "#131a24", fg = "#c94f6d" })
  vim.api.nvim_set_hl(0, "BufferLineTabSelected", { bg = "#131a24", fg = "#131a24" })
end
