require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript", "tsx", "json", "lua", "html", "css", "ruby", "markdown", "vimdoc" },
  sync_install = false,
  highlight = {
    enable = true,
  },
}
