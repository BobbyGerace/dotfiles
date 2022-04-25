local map = require('util').map

local g = vim.g

g.gitgutter_sign_priority = 0
g.gitgutter_preview_win_floating = 1
g.gitgutter_sign_removed = '-'
g.gitgutter_sign_removed_first_line = '^'
g.gitgutter_sign_modified_removed = '~-'

-- Preview hunk
map('n', '<leader>gp', ':GitGutterPreviewHunk<CR>', 'preview git hunk')
