local colorschemes = require('config/colorscheme')
require('config/lazy')

local function get_config(name)
  return function()
    require(string.format('config/%s', name))
  end
end

local lazy_specs = {
  {
    'BobbyGerace/gym.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = get_config('gym')
  },

  -- pickers for search / grep / etc
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      "BobbyGerace/gym.nvim"
    },
    config = get_config('telescope')
  },

  {
    "cbochs/grapple.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true }
    },
    config = get_config('grapple')
  },

  -- syntaxy stuff?
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'RRethy/nvim-treesitter-endwise'
    },
    version = nil,
    build = ':TSUpdate',
    config = get_config('treesitter')
  },

  -- status bar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    config = get_config('lualine')
  },

  -- signs and blame
  {
    'lewis6991/gitsigns.nvim',
    config = get_config('gitsigns')
  },

  -- code breadcrumbs
  {
    "SmiteshP/nvim-navic",
    dependencies = {
      "neovim/nvim-lspconfig"
    }
  },

  -- commenting lines
  {
    'numToStr/Comment.nvim',
    config = get_config('comment')
  },

  -- Surround characters
  { 'tpope/vim-surround' },

  -- Make sure . works on plugins
  { 'tpope/vim-repeat' },

  -- language server stuff
  {
    'neovim/nvim-lspconfig',
    dependencies = { 
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      'nvim-cmp'
    },
    config = get_config('lspconfig')
  },

  -- autocomplete
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    config = get_config('cmp')
  },

  -- show colors
  {
    'norcalli/nvim-colorizer.lua',
    config = get_config('colorizer')
  },
  
  -- file explorer
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = get_config('oil')
  },

  -- indent guides
  { 
    'echasnovski/mini.indentscope', 
    version = false, 
    config = get_config('mini-indentscope')
  },

  -- tmux
  {
    "aserowy/tmux.nvim",
    config = get_config('tmux')
  },

  -- keymap help dialog
  {
    "folke/which-key.nvim",
    config = get_config('which-key')
  },

  -- formatting
  {
    'sbdchd/neoformat',
    config = get_config('neoformat')
  },

  -- copy to clipboard over ssh
  {'ojroques/nvim-osc52'},
}

-- Add colorschemes to the end
table.move(colorschemes, 1, #colorschemes, #lazy_specs + 1, lazy_specs)

require('lazy').setup(lazy_specs);
