local apply_theme = require('util').apply_theme

if vim.g._theme == 'onenord' then
  require('onenord').setup({
    theme = 'dark', -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
    styles = {
      comments = "italic", -- Style that is applied to comments: see `highlight-args` for options
      strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
      keywords = "italic", -- Style that is applied to keywords: see `highlight-args` for options
      functions = "NONE", -- Style that is applied to functions: see `highlight-args` for options
      variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
      diagnostics = "undercurl", -- Style that is applied to diagnostics: see `highlight-args` for options
    },
  })
end

apply_theme('onenord')
