local apply_theme = require('util').apply_theme
local dracula = require("dracula")

dracula.setup({
  italic_comment = true, -- default false
})

apply_theme('dracula')
