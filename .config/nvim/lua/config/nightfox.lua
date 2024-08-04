local apply_theme = require('util').apply_theme

require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "italic",
    }
  }
})

apply_theme('duskfox')
