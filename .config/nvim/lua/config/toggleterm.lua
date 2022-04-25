local map = require('util').map

require('toggleterm').setup{}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit --use-config-file=$HOME/.config/lazygit/config.yml", hidden = true, direction = 'float' })
local vtop = Terminal:new({ cmd = "vtop", hidden = true, direction = 'float' })

local function _lazygit_toggle()
  lazygit:toggle()
end

local function _vtop_toggle()
  vtop:toggle()
end

map("n", "<c-space>", ":ToggleTerm<CR>", 'toggle terminal')
map("t", "<c-space>", "<c-\\><c-n>:ToggleTerm<CR>", 'toggle terminal (from inside)')

map("n", "<leader>gg", _lazygit_toggle, 'open lazygit')
map("n", "<leader>m", _vtop_toggle, 'system monitor')
