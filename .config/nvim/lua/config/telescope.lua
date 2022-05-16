local map = require('util').map
local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.load_extension("live_grep_raw")

telescope.setup {
  defaults = {
    layout_strategy = 'flex',
    layout_config = {
      flex = {
        flip_columns = 180
      },
    },
    file_ignore_patterns = { "node_modules", '.git/' },
    path_display = { 'truncate' },
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
      additional_args = function()
        return { "--hidden" }
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

local function custom_live_grep_raw(opts)
  local defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden"
    }
  }
  opts = vim.tbl_extend("force", defaults, opts or {})
  require('telescope').extensions.live_grep_raw.live_grep_raw(opts)
end

map('n', '<leader>p', function() builtin.find_files() end, 'find files')
map('n', 'gr', function() builtin.lsp_references() end, 'go to references')
map('n', 'gd', function() builtin.lsp_definitions() end, 'go to definitions')
map('n', '<leader>l', function() builtin.buffers() end, 'view open buffers')
map('n', '<leader>h', function() builtin.oldfiles({ only_cwd = true }) end, 'view file history')
map('n', '<leader>gs', function() builtin.git_status() end, 'view git status')
map('n', '<leader>e', function() builtin.diagnostics() end, 'view diagnostics')
-- map('n', '<leader>f', function() builtin.live_grep({ hidden = true }) end, 'find in files')
map('n', '<leader>f', custom_live_grep_raw, 'find in files')
map('n', '<leader>c', function() builtin.commands() end, 'show commands')
map('n', '<leader>c', function() builtin.marks() end, 'show marks')
