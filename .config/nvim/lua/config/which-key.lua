local wk = require("which-key")

wk.setup {
  ignore_missing = true
}

wk.register {
  ['<leader>g'] = { name = 'git' },
  ['<leader>t'] = { name = 'tree' }
}
