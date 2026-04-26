require('nvim-treesitter').install({
  "typescript", "javascript", "tsx", "json", "lua", "html", "css", "ruby", "markdown", "vimdoc", "bash", "go", "c_sharp"
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)
    if ok then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

require('nvim-treesitter-endwise').init()
