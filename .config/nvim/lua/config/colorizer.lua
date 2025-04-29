local map = require('util').map

require('colorizer').setup({ '*' }, {
  css = true
})

-- #A4B392
-- #A4B392EE
-- #FFF
-- hsl(0,50%,50%)
-- hsla(0,50%,50%,0.3)
-- LightBlue
-- rgb(225, 200, 140)
-- rgba(225, 200, 130, 0.5)

map('n', '<leader>sc', ':ColorizerToggle<CR>', 'toggle colorizer')
