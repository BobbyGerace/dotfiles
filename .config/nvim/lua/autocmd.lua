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
