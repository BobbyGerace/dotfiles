vim.g.hello = 'world'
local apply_theme = require('util').apply_theme
local c = require('catppuccin')

local cp = require'catppuccin.api.colors'.get_colors()

if (vim.g._theme == 'catppuccin') then
  c.remap({ 
    -- Lots of bold stuff that I really don't want... messes up my ligatures and cursive
    Visual = { bg = cp.black4, style = "NONE" }, -- Visual mode selection
    VisualNOS = { bg = cp.black4, style = "NONE" }, -- Visual mode selection when vim is "Not Owning the Selection".
    TSKeywordOperator = { fg = cp.sky, style = "NONE" },
    TSPunctSpecial = { fg = cp.maroon, style = "NONE" },
    TSOperator = { fg = cp.sky, style = "NONE" },
    TSConditional = { fg = cp.mauve, style = "NONE" },
    TSRepeat = { fg = cp.mauve, style = "NONE" },

    -- There's a bug where the italics aren't respected for treesitter objects...
    -- everything below is the workaround for now
    ErrorMsg = { fg = cp.red, style = "bold" },
    TSProperty = { fg = cp.yellow, style = "NONE" },
    TSInclude = { fg = cp.teal, style = "NONE" },
    TSFloat = { fg = cp.peach, style = "bold" },
    TSNumber = { fg = cp.peach, style = "bold" },
    TSBoolean = { fg = cp.peach, style = "bold" },
    TSException = { fg = cp.peach, style = "NONE" },
    TSConstBuiltin = { fg = cp.lavender, style = "NONE" },
    TSFuncBuiltin = { fg = cp.peach, style = "NONE" },
    TSTypeBuiltin = { fg = cp.yellow, style = "NONE" },
    TSVariableBuiltin = { fg = cp.teal, style = "NONE" },
    TSFunction = { fg = cp.blue, style = "NONE" },
    TSParameter = { fg = cp.rosewater, style = "NONE" },
  -- TSKeywordFunction = { fg = cp.maroon, style = "NONE" },
  -- TSKeyword = { fg = cp.red, style = "NONE" },
    TSMethod = { fg = cp.blue, style = "NONE" },
    TSNamespace = { fg = cp.rosewater, style = "NONE" },
    TSStringRegex = { fg = cp.peach, style = "NONE" },
    TSVariable = { fg = cp.white, style = "NONE" },
    TSTagAttribute = { fg = cp.mauve, style = "NONE" },
    TSURI = { fg = cp.rosewater, style = "underline" },
    TSLiteral = { fg = cp.teal, style = "NONE" },
    TSEmphasis = { fg = cp.maroon, style = "NONE" },
    TSStringEscape = { fg = cp.pink, style = "NONE" },
    bashTSFuncBuiltin = { fg = cp.red, style = "NONE" },
    bashTSParameter = { fg = cp.yellow, style = "NONE" },
    typescriptTSProperty = { fg = cp.lavender, style = "NONE" },
    cssTSProperty = { fg = cp.yellow, style = "NONE" },
  })

  c.setup {
    styles = {
      comments = "italic",
      functions = "NONE",
      keywords = "italic",
      strings = "NONE",
      variables = "NONE",
    },
  }
end

apply_theme('catppuccin')

