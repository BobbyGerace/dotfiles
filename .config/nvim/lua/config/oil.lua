local map = require('util').map
local oil = require('oil')

oil.setup({
  keymaps = {
    ["<leader>tt"] = { "actions.close", mode = "n" },
  },
  view_options = {
    show_hidden = true,
  }
})

map(
  'n', 
  '<leader>tt', 
  function() oil.open_float( nil, { preview = { vertical = true }}) end, 
  'file explorer'
)
