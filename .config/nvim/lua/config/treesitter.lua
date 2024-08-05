require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript", "tsx", "json", "lua", "html", "css", "ruby", "markdown", "vimdoc", 'bash' },
  sync_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
}
