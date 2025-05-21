local apply_theme = require('lib/theme').apply_theme
require('rose-pine').setup({
  disable_italics = true,
  highlight_groups = {
    Comment = { italic = true }
  }
})

apply_theme('rose-pine')
apply_theme('rose-pine-moon')
