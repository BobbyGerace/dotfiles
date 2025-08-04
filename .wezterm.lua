local wezterm = require 'wezterm'

local config = wezterm.config_builder()

function merge_tables(t1, t2)
  for k, v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

-- https://wezterm.org/colorschemes/index.html
-- Seems like most of the color schemes I use are already defined,
-- but I can define more color schemes by dropping the toml files
-- in .config/wezterm/colors if I need to (use the name in metadata)
-- config.color_scheme = 'Kanso Zen'

-- OR import a custom theme config object and merge it
merge_tables(config, require('themes.kanso-ink'))

-- Ligature test: => === 
config.font = wezterm.font 'Maple Mono NF'

config.enable_tab_bar = false


return config
