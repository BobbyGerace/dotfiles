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

-- function that accepts a hex color string and an integer percentage
-- and returns a darker or lighter color depending on the sign of the percentage
local function color_change(color, percent)
  local num = tonumber(color:gsub("#", ""), 16)
  local amt = math.floor(2.55 * percent)
  local R = math.floor(num / 0x10000) + amt
  local G = math.floor((num % 0x10000) / 0x100) + amt
  local B = (num % 0x100) + amt
  if R < 0 then R = 0 end
  if R > 255 then R = 255 end
  if G < 0 then G = 0 end
  if G > 255 then G = 255 end
  if B < 0 then B = 0 end
  if B > 255 then B = 255 end
  return string.format("#%02x%02x%02x", R, G, B)
end

-- Get background color by inspecting Normal bg
local bg = vim.api.nvim_get_hl_by_name('Normal', true).background
local bg_hex = string.format('#%06x', bg)
-- Load the theme and clone it to avoid modifying the original theme
local original = require('lualine.themes.' .. get_theme_name())
local theme = vim.deepcopy(original)

for _, mode in pairs(theme) do
  mode.a.fg = mode.a.bg
  mode.a.gui = ""

  for _, section in pairs (mode) do
    section.bg = nil
  end

  -- mode.a.bg = color_change(bg_hex, -6)
  -- mode.b.bg = color_change(bg_hex, -4)
  -- -- add c if it doesn't exist
  -- if not mode.c then
  --   mode.c = {}
  -- end
  -- mode.c.bg = color_change(bg_hex, -2)
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
