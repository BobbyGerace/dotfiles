-- dont show line numbers in terminal
vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')

-- checks for when the file changes and updates
vim.cmd('set autoread')
vim.cmd('au CursorHold * checktime')

-- automatically open quickfix
vim.cmd([[
  augroup quickfix
      autocmd!
      autocmd QuickFixCmdPost [^l]* cwindow
      autocmd QuickFixCmdPost l* lwindow
  augroup END
]])

-- autoformat
vim.cmd([[
  augroup fmt
    autocmd!
    au BufWritePre *.js,*.tsx,*.ts,*.jsx,*.css,*.scss,*.html,*.json,*.yml,*.md try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry
  augroup END
]])

-- use  `gym exercise list` to get the list of exercises
function _G.get_exercise_names()
  local handle = io.popen('gym exercise list')
  local result = handle:read('*a')
  handle:close()
  return vim.split(result, '\n')
end

-- vim.cmd([[
--   function! ExerciseCompletion(findstart, base)
--       if a:findstart
--           " locate the start of the word
--           let line = getline('.')
--           let start = col('.') - 1
--           while start > 0 && line[start - 1] =~ '\a'
--               let start -= 1
--           endwhile
--           return start
--       else
--           let matches = luaeval('get_exercise_names()')
--           call filter(matches, 'v:val =~ "^" . a:base')
--           return matches
--       endif
--   endfunction
-- ]])

vim.cmd('au BufRead,BufNewFile *.gym set filetype=gym')
-- vim.cmd('au BufRead,BufNewFile *.gym setlocal completefunc=ExerciseCompletion')

-- vim.cmd([[
-- augroup ExerciseAutoComplete
--     autocmd!
--     autocmd InsertCharPre * if synIDattr(synID(line('.'), col('.') - 1, 1), "name") == 'gymExName' | call feedkeys("\<C-x>\<C-u>", 'n') | endif
-- augroup END
-- ]])

-- local function highlight_unmatched_exercises()
--   local exercises = vim.fn.systemlist("gym exercise list")
--   local exercise_set = {}
--   for _, exercise in ipairs(exercises) do
--     exercise_set[exercise:lower()] = true
--   end

--   local bufnr = vim.api.nvim_get_current_buf()
--   local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
--   for lineno, line in ipairs(lines) do
--     local start_pos, end_pos = line:find("%S+")
--     while start_pos do
--       local word = line:sub(start_pos, end_pos)
--       if vim.fn.synIDattr(vim.fn.synID(lineno, start_pos, 1), "name") == "gymExName" then
--         if not exercise_set[word:lower()] then
--           vim.api.nvim_buf_add_highlight(bufnr, -1, "UnmatchedExercise", lineno - 1, start_pos - 1, end_pos)
--         end
--       end
--       start_pos, end_pos = line:find("%S+", end_pos + 1)
--     end
--   end
-- end

-- vim.api.nvim_create_autocmd({"BufEnter", "TextChanged", "InsertLeave"}, {
--   callback = function()
--     highlight_unmatched_exercises()
--   end
-- })

