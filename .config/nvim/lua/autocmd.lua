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

vim.cmd([[
  function! ExerciseCompletion(findstart, base)
      if a:findstart
          " locate the start of the word
          let line = getline('.')
          let start = col('.') - 1
          while start > 0 && line[start - 1] =~ '\a'
              let start -= 1
          endwhile
          return start
      else
          let matches = luaeval('require"exercise_completion".exercise_names')
          call filter(matches, 'v:val =~ "^" . a:base')
          return matches
      endif
  endfunction
]])

vim.cmd('au BufRead,BufNewFile *.gym set filetype=gym')
vim.cmd('au BufRead,BufNewFile *.gym setlocal completefunc=ExerciseCompletion')

vim.cmd([[
augroup ExerciseAutoComplete
    autocmd!
    autocmd InsertCharPre * if synIDattr(synID(line('.'), col('.') - 1, 1), "name") == 'gymExName' | call feedkeys("\<C-x>\<C-u>", 'n') | endif
augroup END
]])

vim.cmd([=[
  let s:exercise_namespace = nvim_create_namespace('exercise_warnings')

  function! HighlightNewExercises()
      " Clear previous highlighting to avoid duplicates
      call clearmatches()
      call nvim_buf_clear_namespace(0, s:exercise_namespace, 0, -1)

      " Get exercise list from Lua
      let l:exercises = luaeval('require"exercise_completion".exercise_names')

      " Iterate over each line in the file
      for l:lnum in range(1, line('$'))
          let l:line = getline(l:lnum)

          " Check if this line contains a gymExName syntax item
          if synIDattr(synID(l:lnum, col([l:lnum, matchend(l:line, ')\s*\zs\S.\{-}\ze\s*\(#\|$\)')]), 1), "name") == 'gymExName'
              let l:word = tolower(matchstr(l:line, ')\s*\zs\S.\{-}\ze\s*\(#\|$\)'))
              
              " Check if the word is a new exercise
              if index(map(l:exercises, 'tolower(v:val)'), l:word) == -1 " Highlight the word with a squiggly underline
                  call matchadd('ExerciseInfo', '\c' . l:word)
                  
                  " Add virtual text annotation
                  call nvim_buf_set_virtual_text(0, s:exercise_namespace, l:lnum - 1, [['New Exercise', 'WarningMsg']], {})
              endif
          endif
      endfor
  endfunction
]=])

vim.cmd([[
  augroup ExerciseHighlighting
      autocmd!
      autocmd BufReadPost,BufEnter,InsertLeave,TextChanged * call HighlightNewExercises()
  augroup END
]])

