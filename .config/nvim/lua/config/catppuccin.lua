local apply_theme = require('util').apply_theme
local c = require('catppuccin')

c.setup {
  styles = {
    comments = { "italic" },
    functions = { "NONE" },
    keywords = { "italic" },
    strings = { "NONE" },
    variables = { "NONE" },
  },
}

apply_theme('catppuccin')
