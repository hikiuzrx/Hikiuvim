local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Add / menu
vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>',     ui.toggle_quick_menu)

-- Slot navigation
-- <C-h> and <C-t> are safe; <C-d>/<C-s> clobbered vim builtins so moved to Alt
vim.keymap.set('n', '<C-h>',  function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-t>',  function() ui.nav_file(2) end)
vim.keymap.set('n', '<M-3>',  function() ui.nav_file(3) end)
vim.keymap.set('n', '<M-4>',  function() ui.nav_file(4) end)

-- Prev / next: <C-p> was taken by telescope git_files; moved to Alt
vim.keymap.set('n', '<M-p>', function() ui.nav_prev() end)
vim.keymap.set('n', '<M-n>', function() ui.nav_next() end)

-- Open harpoon file in a split directly from normal mode (<leader>1-4)
local function nav_file_split(index, split_cmd)
    local file = mark.get_marked_file_name(index)
    if file and file ~= "" then
        vim.cmd(split_cmd .. " " .. file)
        vim.cmd("wincmd w")
    end
end

for i = 1, 4 do
    vim.keymap.set('n', '<leader>' .. i, function()
        nav_file_split(i, 'vsplit')
    end)
end

-- Inside the harpoon menu: v = vsplit, s = hsplit
vim.api.nvim_create_autocmd("FileType", {
    pattern = "harpoon",
    callback = function()
        vim.keymap.set("n", "v", function()
            nav_file_split(vim.fn.line("."), "vsplit")
        end, { buffer = true })
        vim.keymap.set("n", "s", function()
            nav_file_split(vim.fn.line("."), "split")
        end, { buffer = true })
    end,
})
