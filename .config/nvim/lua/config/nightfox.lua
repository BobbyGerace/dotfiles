local apply_theme = require('util').apply_theme

require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "italic",
    }
  }
})

-- test 123 hello

apply_theme('carbonfox')
