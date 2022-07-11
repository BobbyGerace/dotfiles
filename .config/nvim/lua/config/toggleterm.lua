local map      = require('util').map
local Terminal = require('toggleterm.terminal').Terminal

require('toggleterm').setup {}

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

local function _dbt_preview()
  local rel_path = vim.fn.expand('%:p:~:.')
  local target = 'target/compiled/analytics/' .. rel_path

  local cmd = 'dbt compile -m ' .. rel_path .. ' && echo "select * from ($(cat ' .. target .. ')\n) limit 100;" | snowsql | less -S'
  local term = Terminal:new({ cmd = cmd, hidden = true, direction = 'float' })
  term:open()
end

local function _dbt_run()
  local cmd = 'dbt run | less +F -rK'
  local term = Terminal:new({ cmd = cmd, hidden = true, direction = 'float', })
  term:open()
end

local function _dbt_run_file()
  local rel_path = vim.fn.expand('%:p:~:.')
  local cmd = 'dbt run -m ' .. rel_path .. ' | less +F -rK'
  local term = Terminal:new({ cmd = cmd, hidden = true, direction = 'float', })
  term:open()
end

local function _dbt_show_compiled()
  local rel_path = vim.fn.expand('%:p:~:.')
  local target = 'target/compiled/analytics/' .. rel_path
  vim.cmd('e ' .. target)
end

local function _dbt_parse()
  local cmd = 'dbt parse | less +F -rK'
  local term = Terminal:new({ cmd = cmd, hidden = true, direction = 'float', })
  term:open()
end

vim.api.nvim_create_user_command('DbtRun', _dbt_run, { nargs = '*' })
vim.api.nvim_create_user_command('DbtRunFile', _dbt_run_file, { nargs = '*' })
vim.api.nvim_create_user_command('DbtPreview', _dbt_preview, { nargs = '*' })
vim.api.nvim_create_user_command('DbtShowCompiled', _dbt_show_compiled, { nargs = '*' })
vim.api.nvim_create_user_command('DbtParse', _dbt_parse, { nargs = '*' })

map("n", "<leader>gg", _lazygit_toggle, 'open lazygit')
map("n", "<leader>sm", _vtop_toggle, 'system monitor')
map("n", "<leader>sn", _node_toggle, 'system monitor')
map("n", "<leader>sd", _dbt_preview, 'system monitor')
