vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- Splits: renamed <leader>hs -> <leader>sp to free the <leader>h prefix for gitsigns
vim.keymap.set('n', '<leader>vs', function() vim.cmd("vsplit") end, { desc = "Vertical split" })
vim.keymap.set('n', '<leader>sp', function() vim.cmd("split") end,  { desc = "Horizontal split" })

-- Window resize (window movement uses native <C-w>hjkl)
vim.keymap.set('n', '<leader>>', '<C-w>>', { desc = "Increase split width" })
vim.keymap.set('n', '<leader><', '<C-w><', { desc = "Decrease split width" })
vim.keymap.set('n', '<leader>+', '<C-w>+', { desc = "Increase split height" })
vim.keymap.set('n', '<leader>-', '<C-w>-', { desc = "Decrease split height" })
