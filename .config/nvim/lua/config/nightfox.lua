local apply_theme = require('util').apply_theme

require('nightfox').setup{
  options = {
    styles = {
      comments = 'italic'
    }
  }
}

apply_theme('nightfox')
