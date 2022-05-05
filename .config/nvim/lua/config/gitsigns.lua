local map = require('util').map

require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '-' },
    topdelete = { text = '-' },
    changedelete = { text = '~-' },
  },
  current_line_blame = true,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function bmap(mode, l, r, desc, opts)
      opts = opts or {}
      opts.buffer = bufnr
      map(mode, l, r, desc, opts)
    end

    -- Navigation
    bmap('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    bmap('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    bmap('n', '<leader>gp', gs.preview_hunk, 'preview git hunk')
    bmap('n', '<leader>gb', function() gs.blame_line { full = true } end, 'line blame')
    bmap('n', '<leader>gt', gs.toggle_current_line_blame, 'toggle line blame')
  end
}
