local M = {}

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

  package.loaded["lualine.themes." .. theme_name] = theme
end

return M
