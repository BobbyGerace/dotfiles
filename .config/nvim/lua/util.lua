local M = {}

M.map = function(mode, keys, cmd, opt) 
  opt = opt or { noremap = true, silent = true}
  vim.api.nvim_set_keymap(mode, keys, cmd, opt)
end

M.buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end


return M

