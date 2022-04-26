local map = require('util').map
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    layout_strategy = 'flex',
    path_display = {'truncate'},
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
      additional_args = function(opts)
        return {"--hidden"}
      end
    },
    find_files = {
      hidden = true
    },
    lsp_references = {
      layout_strategy = 'vertical'
    }
  },
}

map('n','<leader>p', ':Telescope find_files<CR>', 'find files')
map('n','gr', ':Telescope lsp_references<CR>', 'go to references')
map('n','gd', ':Telescope lsp_definitions<CR>', 'go to definitions')
map('n','<leader>l', ':Telescope buffers<CR>', 'view open buffers')
map('n', '<leader>h', ':Telescope oldfiles only_cwd=true<CR>', 'view file history')
map('n', '<leader>gs', ':Telescope git_status<CR>', 'view git status')
map('n', '<leader>e', ':Telescope diagnostics<cr>', 'view diagnostics')
map('n','<leader>f', ':lua require("telescope.builtin").live_grep({ hidden = true })<CR>', 'find in files')
map('n','<leader>c', ':lua require("telescope.builtin").commands()<CR>', 'show commands')
