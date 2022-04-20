call plug#begin('~/.local/share/nvim/plugged')

" dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'sharkdp/fd'
Plug 'nvim-treesitter/nvim-treesitter'

" themes
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
Plug 'crusoexia/vim-dracula'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'gosukiwi/vim-atom-dark'
Plug 'mangeshrex/everblush.vim'
Plug 'EdenEast/nightfox.nvim'

" status bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'BobbyGerace/lualine-lsp-progress'
Plug 'kyazdani42/nvim-web-devicons'

" tab bar
Plug 'kdheepak/tabline.nvim'

" git stuff
Plug 'airblade/vim-gitgutter'
Plug 'sindrets/diffview.nvim'

" commenting lines
Plug 'chrisbra/vim-commentary'

" Surround characters
Plug 'tpope/vim-surround'

" Make sure . works on plugins
Plug 'tpope/vim-repeat'

" autoformatting
" Plug 'mitermayer/vim-prettier'

" file tree
Plug 'scrooloose/nerdtree'

" gql syntax highlighting
Plug 'jparise/vim-graphql'

" file search and grepper
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

" lua specific stuff
lua << END
-- Color for highlights
local colors = {
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

local config = {
  sections = {
    lualine_c = {'filename'},
  }
} 

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

vim.diagnostic.config({ severity_sort = true })

ins_left {
	'lsp_progress',
	separators = {
		message = { pre = '', post = ''},
	},
  message = { commenced = 'Initializing', completed = 'Ready' },
	display_components = { 'lsp_client_name', { 'message' }, 'spinner'},
	timer = {progress_enddelay = 0, spinner = 100, lsp_client_name_enddelay = 0 },
  spinner_symbols = {'⠈', '⠐', '⠠', '⢀', '⡀', '⠄', '⠂', '⠁'},
}

require('lualine').setup(config)

require('tabline').setup({
  options = {
    show_tabs_always = true,
    show_filename_only = true,
  }
})

local actions = require("telescope.actions")
local make_entry = require("telescope.make_entry")

require('telescope').setup{
  defaults = {
    -- wrap_results = true,
    path_display = {'smart'},
    initial_mode = 'normal',
    mappings = {
      i = {
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
      },
      n = {
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
      },
    }
  },
  pickers = {
    live_grep = {
      initial_mode = 'insert'
    },
    find_files = {
      initial_mode = 'insert'
    },
  }
}
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local on_attach = function(client, bufnr)
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")    

    buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    -- buf_map(bufnr, "n", "gr", ":LspRename<CR>")
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    buf_map(bufnr, "n", "K", ":LspHover<CR>")
    buf_map(bufnr, "n", "[e", ":LspDiagPrev<CR>")
    buf_map(bufnr, "n", "]e", ":LspDiagNext<CR>")
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
    buf_map(bufnr, "n", "ge", ":LspDiagLine<CR>")

    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup({
    init_options = {
      preferences = {
        importModuleSpecifierPreference = "relative",
      },
    },
    capabilities,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)

        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")

        on_attach(client, bufnr)
    end,
})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
    },
    on_attach = on_attach,
})

-- Color for highlights
local colors = {
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

local signs = { Error = ">>", Warn = ">>", Hint = ">>", Info = ">>" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

END

let g:gitgutter_sign_priority = 0

set completeopt=menu,menuone,noselect

" theme
colorscheme nightfox
let g:airline_theme='deus'
let g:everblushNR=1

" Fixing some diff related theme stuff
" hi DiffDelete guifg='#e06e6e' guibg='#360b0b'
" hi DiffAdd guifg='#8ccf7e' guibg='#11240d'
" hi DiffChange guifg='#6cd0ca' guibg='#0f312f'
" hi DiffText guifg='#6cd0ca' guibg='#1b5653'
" hi Folded guifg='#c47fd5' guibg='#181f21'
" hi FoldColumn guifg='#c47fd5' guibg='#181f21'
" hi GitGutterAdd guifg='#8ccf7e'
" hi GitGutterDelete guifg='#e06e6e'
" hi GitGutterChange guifg='#6cd0ca'

" basic settings
let mapleader=" "
set signcolumn=number
set number
set ignorecase
set smartcase
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab
set mouse=a
set splitbelow splitright

" dont show line numbers in terminal
autocmd TermOpen * setlocal nonumber norelativenumber

" checks for when the file changes and updates
set autoread
au CursorHold * checktime

" Find files in project
nnoremap <silent><leader>p :Telescope find_files hidden=true<CR>
" Search in files
nnoremap <silent><leader>f :Telescope live_grep<CR>
" go to references
nnoremap <silent>gr :Telescope lsp_references include_declaration=false include_current_line=false<CR>
" replace in project (after getting to quickfix window)
nnoremap <leader>R :cfdo %s///g \| update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" replace in current file
nnoremap <leader>r :%s///g<Left><Left>
" replace in project with confirm (after getting to quickfix window)
nnoremap <leader>Rc :cfdo %s///gc \| update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" replace in current file with confirm
nnoremap <leader>rc :%s///gc<Left><Left><Left>
" List open buffers
nnoremap <silent><leader>l :Telescope buffers<CR>
" Flip to previous file
nnoremap <silent><leader><tab> :b#<CR>
" File history
nnoremap <silent><leader>h :Telescope oldfiles<CR>
" Copy to clipboard
nnoremap <silent><leader>y "*y
" Paste from clipboard
nnoremap <silent><leader>v "*p
" Open changed files preview
nnoremap <silent><leader>gd :DiffviewOpen<CR>
" Show file history
nnoremap <silent><leader>gh :DiffviewFileHistory<CR>
" Preview hunk
nnoremap <silent><leader>gp :GitGutterPreviewHunk<CR>
" Preview hunk
nnoremap <silent><leader>gs :Telescope git_status<CR>
" Preview hunk
nnoremap <silent><leader>gb :Telescope git_branches<CR>
" Close tab
nnoremap <silent><leader>qt :tabclose<CR>
" Use K to show documentation in preview window.
nnoremap <silent><leader>d :call <SID>show_documentation()<CR>
" show diagnostics
" nnoremap <silent><leader>e :<C-u>CocList diagnostics<cr>
" show commands
" nnoremap <silent><leader>c :<C-u>CocList commands<cr>
" Show coc commands.
" nnoremap <silent><nowait> <space>c  
" Exit terminal mode
tnoremap <Esc> <C-\><C-n>
" open terminal (shell)
nnoremap <silent><leader>s :10sp <bar> term<CR>
" close buffer without closing window
nnoremap <silent><leader>qb :bp<bar>sp<bar>bn<bar>bd<CR>
" clear search highlighting on esc
map <silent><esc> :noh<cr>

" Switch to window 
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Swap window
nnoremap <silent><leader>wk :wincmd K<CR>
nnoremap <silent><leader>wj :wincmd J<CR>
nnoremap <silent><leader>wh :wincmd H<CR>
nnoremap <silent><leader>wl :wincmd L<CR>

" Resize window
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Toggle nerd tree
nmap <silent><leader>tt :NERDTreeToggle<cr>
" Find current file in tree
nmap <silent><leader>tf :NERDTreeFind<cr>
" Reload the file list
nmap <silent><leader>tr :NERDTreeRefreshRoot<cr>

" Commands
" Refresh config 
:command Reload source $MYVIMRC
" open Diffview with arguments – e.g., :DiffviewOpen origin/development...HEAD
:command -nargs=* Diff :DiffviewOpen <args>
:command -nargs=1 DiffBase :execute 'DiffviewOpen' trim(system('git merge-base --fork-point '.<f-args>))

" Settings for various plugins
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#quickfix_enabled = 0

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 1

let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '~-'

set guioptions-=e " Use showtabline in gui vim
set sessionoptions+=tabpages,globals " store tabpages and globals in session

" select / deselect all in fzf Rg
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'

com! -bar -bang Rg call fzf#vim#grep(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}, 'right'), <bang>0)

" use ripgrep as grep tool
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"automatically open quickfix
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

