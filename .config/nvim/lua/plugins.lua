local function get_config(name)
  return string.format('require("config/%s")', name)
end

require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- Themes
  -- To switch themes, change g._theme variable in options.lua
  use {
    'EdenEast/nightfox.nvim',
    config = get_config('nightfox')
  }
  use { 'michaeldyrynda/carbon' }
  use { 'folke/tokyonight.nvim' }
  use {
    'rmehri01/onenord.nvim',
    config = get_config('onenord')
  }
  use {
    'Mofiqul/dracula.nvim',
    config = get_config('dracula')
  }
  use { "catppuccin/nvim", 
    as = "catppuccin",
    config = get_config('catppucin')
  }

  -- pickers for search / grep / etc
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' }
    },
    config = get_config('telescope')
  }

  -- syntaxy stuff?
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = get_config('treesitter')
  }

  -- allows config reload with :Reload
  use { 'famiu/nvim-reload' }

  -- file outline
  use {
    'stevearc/aerial.nvim',
    config = get_config('aerial')
  }

  -- opens terminals
  use {
    'akinsho/toggleterm.nvim',
    config = get_config('toggleterm')
  }

  -- status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'BobbyGerace/lualine-lsp-progress',
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
    config = get_config('lualine')
  }

  -- view diffs
  use {
    'sindrets/diffview.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = get_config('diffview')
  }

  -- tui for git
  use { 'kdheepak/lazygit.nvim' }

  -- signs and blame
  use {
    'lewis6991/gitsigns.nvim',
    config = get_config('gitsigns')
  }

  -- commenting lines
  use {
    'numToStr/Comment.nvim',
    config = get_config('comment')
  }

  -- Surround characters
  use { 'tpope/vim-surround' }

  -- Make sure . works on plugins
  use { 'tpope/vim-repeat' }

  -- graphql syntax
  use { 'jparise/vim-graphql' }

  -- language server stuff
  use {
    'neovim/nvim-lspconfig',
    requires = { { 'jose-elias-alvarez/nvim-lsp-ts-utils' } },
    config = get_config('lspconfig')
  }

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },
    },
    config = get_config('cmp')
  }

  -- file tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = get_config('nvim-tree')
  }

  -- tab line
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = get_config('bufferline')
  }

  -- because why not?
  use { 'alec-gibson/nvim-tetris' }


  -- show colors
  use {
    'norcalli/nvim-colorizer.lua',
    config = get_config('colorizer')
  }


  -- tmux
  use({
    "aserowy/tmux.nvim",
    config = get_config('tmux')
  })

  -- keymap help dialog
  use {
    "folke/which-key.nvim",
    config = get_config('which-key')
  }

  -- formatting
  use {
    'sbdchd/neoformat',
    config = get_config('neoformat')
  }

  -- copy to clipboard over ssh
  use {'ojroques/nvim-osc52'}
end)
