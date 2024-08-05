local map = require('util').map
local telescope = require('telescope')
local themes = require('telescope.themes')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup {
  defaults = themes.get_ivy({
    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { " ", " ", " ", "", " ", " ", " ", " " }, -- │
    },
    file_ignore_patterns = { "node_modules", '.git/' },
    path_display = { 'filename_first' },
    mappings = {
      i = {
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-a>"] = actions.send_to_qflist + actions.open_qflist, },
      n = {
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
      },
    }
  }),
  pickers = {
    buffers = {
      mappings = {
        n = {
          ["dd"] = "delete_buffer",
        }
      }
    },
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end
    },
    find_files = {
      hidden = true,
      find_command = {
        'rg',
        '--files',
        '--color=never',
        "--no-ignore",
        "--ignore-file=.gitignore",
      },
    },
    oldfiles = {
      initial_mode = 'normal',
    },
  },
  extensions = {
    ["ui-select"] = themes.get_cursor {
      initial_mode = 'normal'
    },
    gym = {
      exercises = {
        theme = "dropdown",
      },
      workouts = {
        theme = "dropdown",
      },
    },
  },
}

telescope.load_extension("live_grep_args")
telescope.load_extension("ui-select")
telescope.load_extension("gym")
telescope.load_extension("recent-files")

local function custom_live_grep_args(opts)
  local defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--no-ignore",
      "--ignore-file=.gitignore",
    }
  }
  opts = vim.tbl_extend("force", defaults, opts or {})
  require('telescope').extensions.live_grep_args.live_grep_args(opts)
end

map('n', '<leader>p', function() telescope.extensions['recent-files'].recent_files({}) end, 'find files')
map('n', 'gr', function() builtin.lsp_references() end, 'go to references')
map('n', 'gd', function() builtin.lsp_definitions() end, 'go to definitions')
map('n', '<leader>l', function() builtin.buffers() end, 'view open buffers')
map('n', '<leader>j', function() telescope.extensions['recent-files'].recent_files({ initial_mode = 'normal' }) end, 'recent files')
map('n', '<leader>gs', function() builtin.git_status() end, 'view git status')
map('n', '<leader>gh', function() builtin.git_bcommits() end, 'view buffer commit history')
map('n', '<leader>e', function() builtin.diagnostics() end, 'view diagnostics')
-- map('n', '<leader>f', function() builtin.live_grep({ hidden = true }) end, 'find in files')
map('n', '<leader>f', custom_live_grep_args, 'find in files')
map('n', '<leader>q', function() builtin.quickfix() end, 'show quickfix list')
map('n', '<leader>o', function() builtin.lsp_document_symbols() end, 'symbol outline')
