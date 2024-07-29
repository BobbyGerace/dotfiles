local map = require('util').map
local telescope = require('telescope')
local themes = require('telescope.themes')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local fb_actions = require("telescope._extensions.file_browser.actions")

telescope.setup {
  defaults = themes.get_ivy({
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
    file_browser = {
      hijack_netrw = true,
      grouped = true,
      hidden = true,
      respect_gitignore = true,
      initial_mode = 'normal',
      mappings = {
        ["n"] = {
          h = fb_actions.goto_parent_dir,
          j = actions.move_selection_worse,
          k = actions.move_selection_better,
          l = actions.select_default,
        },
      },
    },
  },
}

telescope.load_extension("live_grep_args")
telescope.load_extension("file_browser")
telescope.load_extension("ui-select")
telescope.load_extension("gym")

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

map('n', '<leader>p', function() builtin.find_files() end, 'find files')
map('n', 'gr', function() builtin.lsp_references() end, 'go to references')
map('n', 'gd', function() builtin.lsp_definitions() end, 'go to definitions')
map('n', '<leader>l', function() builtin.buffers() end, 'view open buffers')
map('n', '<leader>j', function() builtin.oldfiles({ only_cwd = true }) end, 'view file history')
map('n', '<leader>gs', function() builtin.git_status() end, 'view git status')
map('n', '<leader>gs', function() builtin.git_bcommits() end, 'view buffer commit history')
map('n', '<leader>e', function() builtin.diagnostics() end, 'view diagnostics')
-- map('n', '<leader>f', function() builtin.live_grep({ hidden = true }) end, 'find in files')
map('n', '<leader>f', custom_live_grep_args, 'find in files')
map('n', '<leader>q', function() builtin.quickfix() end, 'show quickfix list')

local curr_dir_args = { select_buffer = true, path = "%:p:h" }
map(
  'n',
  '<leader>tt', 
  function() 
    telescope.extensions.file_browser.file_browser(curr_dir_args) 
  end, 
  'File explorer'
)
map(
  'n',
  '<leader>tr', 
  function() 
    telescope.extensions.file_browser.file_browser({}) 
  end, 
  'File explorer cwd'
)
