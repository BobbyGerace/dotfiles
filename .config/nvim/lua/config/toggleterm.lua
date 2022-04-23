local map = require('util').map

require('toggleterm').setup{}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit --use-config-file=$HOME/.config/lazygit/config.yml", hidden = true, direction = 'float' })
local vtop = Terminal:new({ cmd = "vtop", hidden = true, direction = 'float' })

function _lazygit_toggle()
  lazygit:toggle()
end

function _vtop_toggle()
  vtop:toggle()
end

map("n", "<c-space>", ":ToggleTerm<CR>", {noremap = true, silent = true})
map("t", "<c-space>", "<c-\\><c-n>:ToggleTerm<CR>", {noremap = true, silent = true})
