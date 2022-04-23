
function get_config(name)
	return string.format('require("config/%s")', name)
end

require('packer').startup(function(use)
  use { 'nvim-lua/plenary.nvim' } 
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  use { 'sharkdp/fd' }
  use { 'nvim-treesitter/nvim-treesitter' }

  -- themes
  use { 'sainnhe/sonokai' }
  use { 'sainnhe/everforest' }
  use { 'crusoexia/vim-dracula' }
  use { 'nanotech/jellybeans.vim' }
  use { 'tomasiser/vim-code-dark' }
  use { 'gosukiwi/vim-atom-dark' }
  use { 'mangeshrex/everblush.vim' }
  use { 'EdenEast/nightfox.nvim' }

  -- status bar
  use { 'nvim-lualine/lualine.nvim' }
  use { 'BobbyGerace/lualine-lsp-progress' }
  use { 'kyazdani42/nvim-web-devicons' }

  -- tab bar
  use { 'kdheepak/tabline.nvim' }

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

  -- file search and grepper
  use { 
    'nvim-telescope/telescope.nvim',
    requires =  { { 'nvim-lua/plenary.nvim' } },
    config = get_config('telescope')
  }

  use { 'neovim/nvim-lspconfig' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }

  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }

  use { 'akinsho/toggleterm.nvim' }
end)

