local wk = require('which-key')

local M = {}

M.map = function(mode, keys, cmd, desc, opt)
  opt = opt or { noremap = true, silent = true }
  opt.desc = desc

  if (mode == 'n' and desc ~= nil) then
    wk.add({
      { keys, cmd, desc = desc, mode = mode}
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

function M.parse_hex(int_color)
    return string.format("#%x", int_color)
end

function M.get_hlgroup(name, fallback)
  if vim.fn.hlexists(name) == 1 then
    local group = vim.api.nvim_get_hl(0, { name = name })

    local hl = {
      fg = group.fg == nil and "background" or M.parse_hex(group.fg),
      bg = group.bg == nil and "background" or M.parse_hex(group.bg),
    }

    return hl
  end
  return fallback or {}
end

function M.with_transparent_bg(name)
  local group = vim.api.nvim_get_hl(0, { name = name })

  local hl = {
    fg = group.fg == nil and "background" or M.parse_hex(group.fg),
    bg = "background"
  }

  return hl
end


return M
