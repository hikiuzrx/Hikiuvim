-- ==========================================================================
-- 1. PATH LINKING (Keep this to ensure ARM64 Mac works)
-- ==========================================================================
local ts_path = "/Users/macos/.local/share/nvim/site"
vim.opt.runtimepath:prepend(ts_path)

if vim.fn.isdirectory(ts_path .. "/parser") == 1 then
    vim.opt.runtimepath:prepend(ts_path .. "/parser")
end

-- ==========================================================================
-- 2. PLUGIN LOADING
-- ==========================================================================
local packer_plugins = vim.fn.expand("~/.local/share/nvim/site/pack/packer/start/*")
for _, path in ipairs(vim.fn.glob(packer_plugins, true, true)) do
    vim.opt.runtimepath:append(path)
end

-- ==========================================================================
-- 3. SYSTEM SETTINGS
-- ==========================================================================
package.path = package.path .. ";" .. vim.fn.expand("~/.config/nvim/lua/?.lua")

vim.g.mapleader = " "
vim.opt.termguicolors = true 
vim.opt.number = true         
vim.opt.relativenumber = true -- Helpful for jumping lines

-- ==========================================================================
-- 4. LOAD YOUR HIKI CONFIG (SILENTLY)
-- ==========================================================================
local status, err = pcall(require, "hiki")
if not status then
    -- We only print if there is actually a real error, not just a message
    vim.notify("Hiki load error: " .. err, vim.log.levels.ERROR)
end

-- NOTE: I removed the "my_dashboard" function here because 
-- Alpha-nvim (which is in your packer.lua) handles this much better.
-- I also removed the print() at the bottom to stop the "Press ENTER" prompt.
