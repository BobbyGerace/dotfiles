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
Plug 'mitermayer/vim-prettier'

" file tree
Plug 'scrooloose/nerdtree'

" language server
Plug 'neovim/nvim-lspconfig'

" typescript goodness
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" gql syntax highlighting
Plug 'jparise/vim-graphql'

" file search and grepper
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" lua specific stuff
lua << END
require('lualine').setup({
  sections = {
    lualine_c = {'filename', 'g:coc_status'},
  }
})

require('tabline').setup({
  options = {
    show_tabs_always = true,
    show_filename_only = true,
  }
})

local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
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
  }
}
END

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
nnoremap <silent><leader>e :<C-u>CocList diagnostics<cr>
" show commands
nnoremap <silent><leader>c :<C-u>CocList commands<cr>
" Show coc commands.
nnoremap <silent><nowait> <space>c  
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

" Begin COC stuff (pretty much just copy & pasted)

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
 if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
   set signcolumn=number
 else
   set signcolumn=yes
 endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent><leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent><leader>] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
