---@brief [[
--- Theme utility module for creating and managing Neovim themes.
--- This module provides functions to create custom themes for lualine status bar
--- and utilities for working with highlight groups and colors.
---@brief ]]

local M = {}

---Creates a custom lualine theme and registers it with lualine
---
---This function generates a lualine theme configuration based on the provided colors
---and registers it with lualine so it can be used by setting the theme option in lualine config.
---
---@param theme_name string The name to register the theme under (will be available as "lualine.themes.[theme_name]")
---@param colors table Color configuration with the following fields:
---   - normal: string/table - Color for normal mode highlight
---   - insert: string/table - Color for insert mode highlight
---   - visual: string/table - Color for visual mode highlight
---   - replace: string/table - Color for replace mode highlight
---   - command: string/table - Color for command mode highlight
---   - bg: string/table - Background color
---   - fg: string/table - Foreground color
---   - alt_bg: string/table - Alternative background color
---   - alt_fg: string/table - Alternative foreground color
---@return nil
function M.create_lualine_theme(theme_name, colors)
  local theme = {
    normal = {
      a = { fg = colors.bg, bg = colors.normal, gui = "bold" },
      b = { fg = colors.fg, bg = colors.alt_bg },
      c = { fg = colors.alt_fg, bg = colors.bg },
    },
    insert = {
      a = { fg = colors.bg, bg = colors.insert, gui = "bold" },
    },
    visual = {
      a = { fg = colors.bg, bg = colors.visual, gui = "bold" },
    },
    replace = {
      a = { fg = colors.bg, bg = colors.replace, gui = "bold" },
    },
    command = {
      a = { fg = colors.bg, bg = colors.command, gui = "bold" },
    },
    inactive = {
      a = { fg = colors.alt_fg, bg = colors.bg },
      b = { fg = colors.alt_fg, bg = colors.bg },
      c = { fg = colors.alt_fg, bg = colors.bg },
    },
  }

  -- Register the theme with lualine by adding it to package.loaded
  package.loaded["lualine.themes." .. theme_name] = theme
end

---Applies a colorscheme if it matches the global theme variable
---
---@param theme string The name of the theme to apply
---@return nil
function M.apply_theme(theme)
  if (vim.g._theme == theme) then
    vim.cmd('colorscheme ' .. theme)
  end
end

---Converts an integer color value to a hex string
---
---@param int_color integer The integer color value to convert
---@return string The hex string representation of the color (e.g. "#ffffff")
function M.parse_hex(int_color)
  return string.format("#%x", int_color)
end

---Gets the highlight group colors for a given highlight group name
---
---@param name string The name of the highlight group
---@param fallback table|nil Optional fallback values if the highlight group doesn't exist
---@return table A table with fg and bg fields containing the highlight group colors
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

---Creates a transparent background version of a highlight group
---
---@param name string The name of the highlight group
---@return table A table with fg from the original highlight group and bg set to "background"
function M.with_transparent_bg(name)
  local group = vim.api.nvim_get_hl(0, { name = name })

  local hl = {
    fg = group.fg == nil and "background" or M.parse_hex(group.fg),
    bg = "background"
  }

  return hl
end

return M
