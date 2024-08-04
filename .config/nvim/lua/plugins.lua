require('config/lazy')

local function get_config(name)
  return function()
    require(string.format('config/%s', name))
  end
end

require('lazy').setup({
  {
    'BobbyGerace/gym.nvim',
    config = get_config('gym')
  },

  -- Themes
  -- To change, set vim.g._theme in init.lua
  -- {
  --   'folke/tokyonight.nvim',
  --   config = get_config('tokyonight')
  -- },

  {
    'EdenEast/nightfox.nvim',
    config = get_config('nightfox')
  },

  -- {
  --   'Mofiqul/dracula.nvim',
  --   config = get_config('dracula')
  -- },

  -- {
  --   "catppuccin/nvim", 
  --   as = "catppuccin",
  --   config = get_config('catppuccin')
  -- },

  -- { 
  --   'rose-pine/neovim', 
  --   name = 'rose-pine',
  --   config = get_config('rose-pine') 
  -- },

  -- pickers for search / grep / etc
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "BobbyGerace/gym.nvim" },
    },
    config = get_config('telescope')
  },

  -- syntaxy stuff?
  {
    'nvim-treesitter/nvim-treesitter',
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
      { "neovim/nvim-lspconfig" }
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
      { 'jose-elias-alvarez/nvim-lsp-ts-utils' },
      { 'nvim-cmp' }
    },
    config = get_config('lspconfig')
  },

  -- autocomplete
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },
    },
    config = get_config('cmp')
  },

  -- show colors
  {
    'norcalli/nvim-colorizer.lua',
    config = get_config('colorizer')
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

  -- copilot
  {
    'github/copilot.vim',
    config = get_config('copilot')
  },
})
