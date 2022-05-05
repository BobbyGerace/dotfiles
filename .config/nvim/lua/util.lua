local wk = require('which-key')

local M = {}

M.map = function(mode, keys, cmd, desc, opt)
  opt = opt or { noremap = true, silent = true }
  opt.desc = desc

  if (mode == 'n' and desc ~= nil) then
    local registerTable = { cmd, desc }
    for k, v in pairs(opt) do registerTable[k] = v end
    wk.register({
      [keys] = { cmd, desc }
    })
  else
    vim.keymap.set(mode, keys, cmd, opt)
  end
end

M.buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
    silent = true,
  })
end

M.apply_theme = function(theme)
  if (vim.g._theme == theme) then
    vim.cmd('colorscheme ' .. theme)
  end
end

return M
