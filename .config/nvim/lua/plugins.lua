function get_config(name)
	return string.format('require("config/%s")', name)
end

require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- Themes
  use { 'sainnhe/sonokai' }
  use { 'sainnhe/everforest' }
  use { 'crusoexia/vim-dracula' }
  use { 'nanotech/jellybeans.vim' }
  use { 'tomasiser/vim-code-dark' }
  use { 'gosukiwi/vim-atom-dark' }
  use { 'mangeshrex/everblush.vim' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'michaeldyrynda/carbon' }

  -- pickers for search / grep / etc
  use { 
    'nvim-telescope/telescope.nvim',
    requires =  { { 'nvim-lua/plenary.nvim' } },
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
    'simrat39/symbols-outline.nvim',
    config = get_config('symbols-outline')
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

  -- tab bar
  use { 
    'kdheepak/tabline.nvim',
    config = get_config('tabline')
  }

  -- git stuff
  use { 'tpope/vim-fugitive' }
  use { 
    'airblade/vim-gitgutter',
    config = get_config('gitgutter')
  }
  use {
    'sindrets/diffview.nvim',
    requires =  { { 'nvim-lua/plenary.nvim' } },
    config = get_config('diffview')
  }
  use { 'kdheepak/lazygit.nvim' }

  -- commenting lines
  use { 'chrisbra/vim-commentary' }

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
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires =  { { 'nvim-lua/plenary.nvim' } },
    config = get_config('null-ls')
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

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = get_config('nvim-tree')
  }

end)

