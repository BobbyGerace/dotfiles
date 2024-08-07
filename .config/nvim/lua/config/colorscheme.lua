local themes = {
  tokyonight = {
    'folke/tokyonight.nvim',
    theme_name = 'tokyonight-storm',
    -- theme_name = 'tokyonight-night',
    -- theme_name = 'tokyonight-moon',
  },
  nightfox = {
    'EdenEast/nightfox.nvim',
    theme_name = 'nordfox',
    -- theme_name = 'carbonfox',
    -- theme_name = 'duskfox',
    -- theme_name = 'terafox',
  },
  ['night-owl'] = { 
    "oxfist/night-owl.nvim",
  },
  dracula = {
    'Mofiqul/dracula.nvim',
    lualine_name = 'dracula-nvim',
  },
  catppuccin = {
    "catppuccin/nvim", 
    theme_name = 'catppuccin-mocha',
    -- theme_name = 'catppuccin-frappe',
    -- theme_name = 'catppuccin-macchiato',
  },
  ['rose-pine'] = { 
    'rose-pine/neovim', 
    name = 'rose-pine',
    lualine_name = 'rose-pine',
    theme_name = 'rose-pine-main',
    -- theme_name = 'rose-pine-moon',
  },
  neomodern = {
    "cdmill/neomodern.nvim",
    -- theme_name = 'iceclimber',
    -- theme_name = 'campfire',
    theme_name = 'darkforest',
    -- theme_name = 'coffeecat',
    -- theme_name = 'roseprime',
    theme_config = function(self)
      require('neomodern').setup({
        style = self.theme_name
      })
      require('neomodern').load()
    end,
    lualine_name = 'neomodern'
  }
}

local theme_name = 'neomodern'
local current_theme = themes[theme_name]

local default_config = function() require(theme_name).setup({}) end

local theme_config = function()
  if current_theme.theme_config then
    current_theme:theme_config() 
  else
    default_config()
  end

  local cs = current_theme.theme_name or theme_name
  vim.cmd("colorscheme " .. cs)
end

-- Switch to load all themes for easy comparison
local load_all = true
local all_themes = vim.tbl_values(themes)
local lazy_specs = load_all and all_themes or { current_theme }

vim.g._lualine_theme = current_theme.lualine_name or current_theme.theme_name or theme_name

current_theme.config = theme_config
current_theme.priority = 1000
current_theme.lazy = false

return lazy_specs
