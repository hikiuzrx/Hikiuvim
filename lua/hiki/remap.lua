vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- Centered scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move selection up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Splits: renamed <leader>hs -> <leader>sp to free the <leader>h prefix for gitsigns
vim.keymap.set('n', '<leader>vs', function() vim.cmd("vsplit") end, { desc = "Vertical split" })
vim.keymap.set('n', '<leader>sp', function() vim.cmd("split") end,  { desc = "Horizontal split" })

-- Window resize (window movement uses native <C-w>hjkl)
vim.keymap.set('n', '<leader>>', '<C-w>>', { desc = "Increase split width" })
vim.keymap.set('n', '<leader><', '<C-w><', { desc = "Decrease split width" })
vim.keymap.set('n', '<leader>+', '<C-w>+', { desc = "Increase split height" })
vim.keymap.set('n', '<leader>-', '<C-w>-', { desc = "Decrease split height" })
