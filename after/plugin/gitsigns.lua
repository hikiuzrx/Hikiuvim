require('gitsigns').setup({
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },

  signcolumn = true,
  numhl      = false,
  linehl     = false,

  word_diff = false,

  current_line_blame = true,
  current_line_blame_opts = {
    delay = 300,
    virt_text_pos = 'eol',
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- 🔁 Navigation between changes
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(gs.next_hunk)
      return '<Ignore>'
    end, "Next hunk")

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(gs.prev_hunk)
      return '<Ignore>'
    end, "Prev hunk")

    -- ⚡ Actions
    map('n', '<leader>hs', gs.stage_hunk, "Stage hunk")
    map('n', '<leader>hr', gs.reset_hunk, "Reset hunk")
    map('n', '<leader>hu', gs.undo_stage_hunk, "Undo stage")

    map('n', '<leader>hp', gs.preview_hunk, "Preview hunk")
    map('n', '<leader>hb', gs.blame_line, "Blame line")

    -- 🔍 Diff
    map('n', '<leader>hd', gs.diffthis, "Diff this")
    map('n', '<leader>hD', function()
      gs.diffthis('~')
    end, "Diff against previous")

    -- 🧹 Toggle
    map('n', '<leader>tb', gs.toggle_current_line_blame, "Toggle blame")
  end,
})
