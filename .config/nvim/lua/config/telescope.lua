local map = require('util').map
local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

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
        ["<C-a>"] = actions.send_to_qflist + actions.open_qflist, },
      n = {
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
      },
    }
  },
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
      hidden = true
    },
    lsp_references = {
      layout_strategy = 'vertical'
    }
  },
  extensions = {
    ["ui-select"] = require('telescope.themes').get_cursor {
      initial_mode = 'normal'
    }
  },
}

telescope.load_extension("live_grep_args")
telescope.load_extension("ui-select")

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
      "--hidden"
    }
  }
  opts = vim.tbl_extend("force", defaults, opts or {})
  require('telescope').extensions.live_grep_args.live_grep_args(opts)
end

map('n', '<leader>p', function() builtin.find_files() end, 'find files')
map('n', 'gr', function() builtin.lsp_references() end, 'go to references')
map('n', 'gd', function() builtin.lsp_definitions() end, 'go to definitions')
map('n', '<leader>l', function() builtin.buffers() end, 'view open buffers')
map('n', '<leader>h', function() builtin.oldfiles({ only_cwd = true }) end, 'view file history')
map('n', '<leader>gs', function() builtin.git_status() end, 'view git status')
map('n', '<leader>e', function() builtin.diagnostics() end, 'view diagnostics')
-- map('n', '<leader>f', function() builtin.live_grep({ hidden = true }) end, 'find in files')
map('n', '<leader>f', custom_live_grep_args, 'find in files')
map('n', '<leader>c', function() builtin.commands() end, 'show commands')
map('n', '<leader>c', function() builtin.marks() end, 'show marks')

local pickers = require "telescope.pickers"
local previewers = require "telescope.previewers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local get_current_exercise_name = function()
  -- run `gym workout parse <filename>` on the current file
  handle = io.popen("gym workout parse " .. vim.fn.expand("%:p"))
  result = handle:read("*a")
  handle:close()

  -- decode the JSON response inside a try/catch block
  local ok, response = pcall(vim.fn.json_decode, result)

  if not ok then
    return nil
  end

  -- search through response.exercises to find where lineStart and lineEnd contain cursor position
  for _, exercise in ipairs(response.exercises) do
    if exercise.lineStart <= vim.fn.line(".") and exercise.lineEnd >= vim.fn.line(".") then
      return exercise.name
    end
  end

  return nil
end

-- if we get a name, get the history. Otherwise just return an empty list
local get_current_exercise_history = function()
  local name = get_current_exercise_name()
  if name == nil then
    return {}
  end

  return vim.fn.systemlist("gym exercise history --locations-only \"" .. name .. "\"")

end


local exercise_history = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Exercise History",
    finder = finders.new_table {
      results = get_current_exercise_history(),
      entry_maker = function(entry)
        local filename, lineno = string.match(entry, "(.*):(%d+)")
        return {
          value = entry,
          display = entry,
          ordinal = entry,
          filename = filename,
          lineno = tonumber(lineno),
        }
      end
    },
    previewer = previewers.new_buffer_previewer({
      define_preview = function(self, entry, status)
        local bufnr = self.state.bufnr
        vim.api.nvim_buf_set_option(bufnr, 'filetype', 'gym')
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.fn.readfile(entry.filename))
        vim.fn.setpos('.', {bufnr, 8, 0, 0})
        vim.cmd('normal! zz')
        vim.api.nvim_buf_add_highlight(bufnr, -1, 'Search', entry.lineno - 1, 0, -1)
      end,
    }),
    sorter = conf.file_sorter(opts),
  }):find()
end

map('n', '<leader>wt', colors, 'show marks')
