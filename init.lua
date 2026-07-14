vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

local ok, err = pcall(require, "hiki")
if not ok then
    vim.notify("Hiki load error: " .. err, vim.log.levels.ERROR)
end
