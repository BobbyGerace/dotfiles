local M = {}

M.map = function(mode, keys, cmd, opt) 
  opt = opt or { noremap = true, silent = true}
  vim.api.nvim_set_keymap(mode, keys, cmd, opt)
end

return M

