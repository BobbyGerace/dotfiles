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

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = get_config('treesitter')
  }

  use { 'ryanoasis/vim-devicons' }

  use { 'famiu/nvim-reload' }


  use { 
    'simrat39/symbols-outline.nvim',
    config = get_config('symbols-outline')
  }

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

  
  -------------- TODO -------------- 
  use { 'nvim-lua/plenary.nvim' } 

  use { 'sharkdp/fd' }

  -- tab bar
  use { 
    'kdheepak/tabline.nvim',
    config = get_config('tabline')
  }

  -- git stuff
  use { 'tpope/vim-fugitive' }
  use { 'airblade/vim-gitgutter' }
  use { 'sindrets/diffview.nvim' }
  use { 'kdheepak/lazygit.nvim' }

  -- commenting lines
  use { 'chrisbra/vim-commentary' }

  -- Surround characters
  use { 'tpope/vim-surround' }

  -- Make sure . works on plugins
  use { 'tpope/vim-repeat' }

  -- file tree
  use { 'scrooloose/nerdtree' }

  -- gql syntax highlighting
  use { 'jparise/vim-graphql' }

  use { 'neovim/nvim-lspconfig' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }

  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }

end)

