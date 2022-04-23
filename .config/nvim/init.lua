require('plugins')
local util = require('util')
local map = util.map

vim.diagnostic.config({ severity_sort = true })


local null_ls = require("null-ls")

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
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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


-- Find files in project

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

