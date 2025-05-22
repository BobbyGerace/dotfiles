local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- https://wezterm.org/colorschemes/index.html
-- Seems like most of the color schemes I use are already defined,
-- but I can define more color schemes by dropping the toml files
-- in .config/wezterm/colors if I need to
config.color_scheme = 'Everforest Dark (Gogh)'

-- Ligature test: => === 
config.font = wezterm.font 'Maple Mono NF'

config.enable_tab_bar = false

return config
