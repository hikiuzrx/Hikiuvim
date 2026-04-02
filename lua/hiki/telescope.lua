local status, builtin = pcall(require, "telescope.builtin")
if not status then
    return
end
vim.keymap.set('n', '<leader>fs', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n','<leader>fb',builtin.buffers, { desc = "Telescope buffers"})
