local map = require('util').map
require('diffview').setup {}

local get_fork_point = function(base)
  local handle = io.popen('git merge-base --fork-point ' .. base)
  if (handle ~= nil) then
    local result = handle:read("*a")
    handle:close()
    return result:gsub("%s+", "")
  end
end

local diff_base = function(opts)
  local base = opts.fargs[1]
  local fork_point = get_fork_point(base)
  vim.cmd('DiffviewOpen ' .. fork_point)
end

-- open Diffview with arguments – e.g., :DiffviewOpen origin/development...HEAD
vim.api.nvim_create_user_command('Diff', 'DiffviewOpen <args>', { nargs = '*' })
vim.api.nvim_create_user_command('DiffBase', diff_base, { nargs = 1 })

-- Open changed files preview
map('n', '<leader>gd', ':DiffviewOpen<CR>', 'open working tree diff')
-- Show file history
map('n', '<leader>gh', ':DiffviewFileHistory %<CR>', 'open file history')
