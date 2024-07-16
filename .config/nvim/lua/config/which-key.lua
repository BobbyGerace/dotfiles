local wk = require("which-key")

wk.setup {
  ignore_missing = true
}

wk.add {
  { '<leader>g', group = 'git' },
  { '<leader>t', group = 'tree' },
  { '<leader>s', group = 'show' }
}
