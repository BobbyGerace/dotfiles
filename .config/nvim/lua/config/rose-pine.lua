local apply_theme = require('util').apply_theme
require('rose-pine').setup({
  disable_italics = true,
  highlight_groups = {
    Comment = { italic = true }
  }
})

apply_theme('rose-pine')
