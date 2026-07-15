require("persistence").setup()

vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end,              { desc = "Restore session for cwd" })
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" })
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end,              { desc = "Don't save session on exit" })
