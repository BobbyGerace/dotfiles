local map = require('util').map
require('diffview').setup{}

-- open Diffview with arguments – e.g., :DiffviewOpen origin/development...HEAD
vim.cmd('command! -nargs=* Diff :DiffviewOpen <args>')
vim.cmd("command! -nargs=1 DiffBase :execute 'DiffviewOpen' trim(system('git merge-base --fork-point '.<f-args>))")
-- Open changed files preview
map('n', '<leader>gd', ':DiffviewOpen<CR>')
-- Show file history
map('n', '<leader>gh', ':DiffviewFileHistory<CR>')
