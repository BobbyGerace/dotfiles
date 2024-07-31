local function get_theme_name()
  if vim.g._theme == 'dracula' then
    return 'dracula-nvim'
  elseif vim.g._theme == 'rose-pine-moon' then
    return 'rose-pine'
  elseif vim.g._theme == 'tokyonight-night' then
    return 'tokyonight'
  else
    return vim.g._theme
  end
end

-- Load the theme and clone it to avoid modifying the original theme
local original = require('lualine.themes.' .. get_theme_name())
local theme = vim.deepcopy(original)

for _, mode in pairs(theme) do
  mode.a.fg = mode.a.bg
  mode.a.gui = ""

  for _, section in pairs (mode) do
    section.bg = nil
  end
end


local config = {
  options = {
    theme = theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'diagnostics', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

require('lualine').setup(config)
