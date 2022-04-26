require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript", "tsx", "json", "lua", "html", "css"},
  sync_install = false,
  highlight = {
    enable = true,
  },
}
