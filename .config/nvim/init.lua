require('plugins')
local util = require('util')
local map = util.map

-- Color for highlights
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

require('toggleterm').setup{}
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit --use-config-file=$HOME/.config/lazygit/config.yml", hidden = true, direction = 'float' })
local vtop = Terminal:new({ cmd = "vtop", hidden = true, direction = 'float' })

function _lazygit_toggle()
  lazygit:toggle()
end

function _vtop_toggle()
  vtop:toggle()
end


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

local signs = { Error = ">>", Warn = ">>", Hint = ">>", Info = ">>" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Config

vim.cmd('colorscheme nightfox')

-- vim.opt behaves like "set"
local o = vim.opt
local g = vim.g

g.gitgutter_sign_priority = 0
g.mapleader = ' '
o.completeopt = 'menu,menuone,noselect'
o.signcolumn = 'number'
o.number = true
o.ignorecase = true
o.smartcase = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.mouse = 'a'
o.splitbelow = true 
o.splitright = true
o.grepprg = 'rg --vimgrep --no-heading'
o.grepformat = '%f:%l:%c:%m,%f:%l:%m'

-- dont show line numbers in terminal
vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')

-- checks for when the file changes and updates
vim.cmd('set autoread')
vim.cmd('au CursorHold * checktime')

-- automatically open quickfix
vim.cmd([[
  augroup quickfix
      autocmd!
      autocmd QuickFixCmdPost [^l]* cwindow
      autocmd QuickFixCmdPost l* lwindow
  augroup END
]])

-- Settings for various plugins
g.NERDTreeQuitOnOpen = 1
g.NERDTreeShowHidden=1

g.gitgutter_preview_win_floating = 1
g.gitgutter_sign_removed = '-'
g.gitgutter_sign_removed_first_line = '^'
g.gitgutter_sign_modified_removed = '~-'

-- Find files in project

-- map('n', '<leader>gg','<CMD>lua lazy_git()<CR>')
-- replace in project (after getting to quickfix window)
map('n','<leader>R', ':cfdo %s///g | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>')
-- replace in current file
map('n','<leader>r', ':%s///g<Left><Left>')
-- replace in project with confirm (after getting to quickfix window)
map('n','<leader>Rc', ':cfdo %s///gc | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>')
-- replace in current file with confirm
map('n','<leader>rc', ':%s///gc<Left><Left><Left>')
-- Flip to previous file
map('n', '<leader><tab>', ':b#<CR>')
-- Copy to clipboard
map('n', '<leader>y', '"*y')
-- Paste from clipboard
map('n', '<leader>v', '"*p')
-- Open changed files preview
map('n', '<leader>gd', ':DiffviewOpen<CR>')
-- Show file history
map('n', '<leader>gh', ':DiffviewFileHistory<CR>')
-- Preview hunk
map('n', '<leader>gp', ':GitGutterPreviewHunk<CR>')
-- Close tab
map('n', '<leader>qt', ':tabclose<CR>')
-- Use K to show documentation in preview window.
--map('n', '<leader>d', ':call <SID>show_documentation()<CR>')

-- Exit terminal mode
-- map('t', '<Esc>', '<C-\\><C-n>')
map('n', '<esc>', ':noh<cr>', { silent = true })

-- open terminal (shell)
map('n', '<leader>s', ':10sp <bar> term<CR>')
-- close buffer without closing window
map('n', '<leader>qb', ':bp<bar>sp<bar>bn<bar>bd<CR>')
-- Switch to window 
map('n', '<c-k>', ':wincmd k<CR>')
map('n', '<c-j>', ':wincmd j<CR>')
map('n', '<c-h>', ':wincmd h<CR>')
map('n', '<c-l>', ':wincmd l<CR>')

-- Swap window
map('n', '<leader>wk', ':wincmd K<CR>')
map('n', '<leader>wj', ':wincmd J<CR>')
map('n', '<leader>wh', ':wincmd H<CR>')
map('n', '<leader>wl', ':wincmd L<CR>')

-- Resize window
map('n', '<Leader>=', ':exe "resize " . (winheight(0) * 3/2)<CR>')
map('n', '<Leader>-', ':exe "resize " . (winheight(0) * 2/3)<CR>')

-- Toggle nerd tree
map('n', '<leader>tt', ':NERDTreeToggle<cr>')
-- Find current file in tree
map('n', '<leader>tf', ':NERDTreeFind<cr>')
-- Reload the file list
map('n', '<leader>tr', ':NERDTreeRefreshRoot<cr>')

vim.cmd('command! Reload source $MYVIMRC')
-- open Diffview with arguments – e.g., :DiffviewOpen origin/development...HEAD
vim.cmd('command! -nargs=* Diff :DiffviewOpen <args>')
vim.cmd("command! -nargs=1 DiffBase :execute 'DiffviewOpen' trim(system('git merge-base --fork-point '.<f-args>))")
map("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
map("n", "<leader>vt", "<cmd>lua _vtop_toggle()<CR>", {noremap = true, silent = true})
map("n", "<leader><CR>", ":ToggleTerm", {noremap = true, silent = true})
