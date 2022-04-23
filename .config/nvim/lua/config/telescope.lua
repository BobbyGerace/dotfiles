local map = require('util').map
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    -- wrap_results = true,
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
    }
  },
}

-- Search in files
map('n','<leader>p', ':Telescope find_files<CR>')
-- go to references
map('n','gr', ':Telescope lsp_references<CR>')
-- go to definition(s)
map('n','gd', ':Telescope lsp_definitions<CR>')
-- List open buffers
map('n','<leader>l', ':Telescope buffers<CR>')
-- File history
map('n', '<leader>h', ':Telescope oldfiles only_cwd=true<CR>')
-- Preview hunk
map('n', '<leader>gs', ':Telescope git_status<CR>')
-- Preview hunk
map('n', '<leader>gb', ':Telescope git_branches<CR>')
-- show diagnostics
map('n', '<leader>e', ':Telescope diagnostics<cr>')
-- find files
map('n','<leader>f', ':lua require("telescope.builtin").live_grep({ hidden = true })<CR>')
