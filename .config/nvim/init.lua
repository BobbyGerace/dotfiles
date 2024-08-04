-- For easy theme switching
vim.g._theme = 'duskfox'

-- All non plugin related (vim) options
require("options")
-- Plugin management via Lazy.nvim
require("plugins")
-- Vim mappings
require("mappings")
-- Vim autocommands/autogroups
require("autocmd")

