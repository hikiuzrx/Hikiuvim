local status, telescope = pcall(require, "telescope")
if not status then return end

local builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        -- This ensures the previewer uses the modern highlighter
        -- If you STILL get the error after switching to 'master' branch,
        -- change 'treesitter = true' to 'treesitter = false' below.
        preview = {
            treesitter = true,
        },
        file_ignore_patterns = { "node_modules", ".git/" },
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                preview_width = 0.55,
            },
        },
    },
})

-- Your Keymaps
vim.keymap.set('n', '<leader>fs', builtin.find_files, { desc = "Find Files" }) -- Kept your 'fs' as well
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Git Files" })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep Search" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope buffers" })
