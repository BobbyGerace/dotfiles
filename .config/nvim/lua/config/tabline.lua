require('tabline').setup({
  options = {
    show_tabs_always = true,
    show_filename_only = true,
  }
})

vim.cmd('set sessionoptions+=tabpages,globals')

