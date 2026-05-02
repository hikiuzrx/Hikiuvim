-- Harpoon setup
local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- ========================
-- Basic Harpoon Keymaps
-- ========================

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

-- Quick navigation (replace buffer)
vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-d>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)

vim.keymap.set('n', '<C-p>', function() ui.nav_prev() end)
vim.keymap.set('n', '<C-n>', function() ui.nav_next() end)
vim.keymap.set('n', '<C-n>s', function()
  ui.nav_next()
  vim.cmd("vsplit")
end)
vim.keymap.set('n','<C-p>s',function()  
     ui.nav_prev()
     vim.cmd("vsplit")
end)
-- ========================
-- Split Navigation Helper
-- ========================

local function nav_file_split(index, split_cmd)
  local file = mark.get_marked_file_name(index)

  if file and file ~= "" then
    vim.cmd(split_cmd .. " " .. file)
    vim.cmd("wincmd w") -- move to the new split
  end
end

-- Optional: direct split keymaps (outside menu)
for i = 1, 4 do
  vim.keymap.set('n', '<leader>' .. i, function()
    nav_file_split(i, 'vsplit')
  end)
end

-- ========================
-- Harpoon Menu Enhancements
-- ========================

vim.api.nvim_create_autocmd("FileType", {
  pattern = "harpoon",
  callback = function()
    -- Open in vertical split
    vim.keymap.set("n", "v", function()
      local index = vim.fn.line(".")
      nav_file_split(index, "vsplit")
    end, { buffer = true })

    -- Open in horizontal split
    vim.keymap.set("n", "s", function()
      local index = vim.fn.line(".")
      nav_file_split(index, "split")
    end, { buffer = true })
  end,
})
