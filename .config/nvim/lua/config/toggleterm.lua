local map = require('util').map
local Terminal  = require('toggleterm.terminal').Terminal

require('toggleterm').setup{}

local lazygit = Terminal:new({ cmd = "lazygit --use-config-file=$HOME/.config/lazygit/config.yml", hidden = true, direction = 'float' })
local vtop = Terminal:new({ cmd = "vtop", hidden = true, direction = 'float' })
local node = Terminal:new({ cmd = "node", hidden = true, direction = 'float' })

local function _lazygit_toggle()
  lazygit:toggle()
end

local function _vtop_toggle()
  vtop:toggle()
end

local function _node_toggle()
  node:toggle()
end

map("n", "<leader>gg", _lazygit_toggle, 'open lazygit')
map("n", "<leader>sm", _vtop_toggle, 'system monitor')
map("n", "<leader>sn", _node_toggle, 'system monitor')
