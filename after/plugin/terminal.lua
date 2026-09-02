-- terminal.lua
-- ===============================

vim.o.shell = "/bin/zsh"

-- ====================================
-- 1️⃣ Load all environment variables from .env
-- ====================================
local env_path = vim.fn.getcwd() .. "/.env"
local file = io.open(env_path, "r")
if file then
    for line in file:lines() do
        -- Skip empty lines and comments
        if line:match("^%s*$") == nil and not line:match("^%s*#") then
            local key, val = line:match("([%w_]+)%s*=%s*(.+)")
            if key and val then
                -- Remove surrounding quotes if present
                val = val:gsub('^"(.*)"$', "%1")
                val = val:gsub("^'(.*)'$", "%1")
                vim.fn.setenv(key, val)
            end
        end
    end
    file:close()
end

-- ====================================
-- 2️⃣ ToggleTerm setup
-- ====================================
require("toggleterm").setup({
    open_mapping = [[<C-\>]], -- was <leader>j, which conflicted with <C-w>j window move
    direction = 'horizontal',
    -- size depends on direction: rows for a horizontal split, columns for a vertical one
    size = function(term)
        if term.direction == 'horizontal' then
            return 15
        elseif term.direction == 'vertical' then
            return math.floor(vim.o.columns * 0.4)
        end
    end,
    persist_size = true,
    float_opts = {
        border = 'curved',
    },
})

-- ====================================
-- 3️⃣ Dynamic terminal switcher
-- ====================================
local function goto_terminal()
    local count = vim.fn.input('Go to Terminal #: ')
    if count ~= "" then
        vim.cmd(count .. "ToggleTerm")
    end
end

-- Kill the current terminal: ends its shell job and wipes the buffer,
-- freeing that terminal's number (unlike toggling, which only hides it).
local function kill_terminal()
    if vim.bo.buftype == 'terminal' then
        vim.cmd('stopinsert')   -- drop out of terminal mode first
        vim.cmd('bdelete!')     -- force-delete kills the running job
    end
end

-- ====================================
-- 4️⃣ Terminal keymaps
-- ====================================
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }

    -- Basic escape
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)

    -- Kill this terminal
    vim.keymap.set('t', '<leader>tq', kill_terminal, opts)

    -- Navigation: back to code
    vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)

    -- Cycle through terminals
    vim.keymap.set('t', '<C-n>', [[<C-\><C-n>:lua require("toggleterm").toggle_next()<CR>]], opts)
    vim.keymap.set('t', '<C-p>', [[<C-\><C-n>:lua require("toggleterm").toggle_prev()<CR>]], opts)

    -- Dynamic number switch
    vim.keymap.set('t', '<leader>tn', [[<C-\><C-n>:lua require("toggleterm").toggle_command()<CR>]], opts)

    -- Manual dynamic jump
    vim.keymap.set('t', '<leader>tg', function()
        vim.cmd([[stopinsert]]) -- Drop to normal mode first
        goto_terminal()
    end, opts)
end

-- Apply keymaps to every terminal opened
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Also add dynamic jump in normal mode
vim.keymap.set('n', '<leader>tg', goto_terminal, { desc = "Go to Terminal #" })

-- Kill the focused terminal from normal mode too
vim.keymap.set('n', '<leader>tq', kill_terminal, { desc = "Kill current terminal" })

-- Open a specific numbered terminal directly.
-- Each number is its own shell/buffer, so <leader>t1..t4 give you independent
-- terminals (unlike :split, which just shows the SAME terminal twice).
-- This avoids the flaky `2<C-\>` count prefix, which drops the count.
for i = 1, 4 do
    -- <leader>t1..t4 -> horizontal split
    vim.keymap.set('n', '<leader>t' .. i, function()
        vim.cmd(i .. 'ToggleTerm direction=horizontal')
    end, { desc = "Toggle terminal #" .. i .. " (horizontal)" })

    -- <leader>tv1..tv4 -> vertical split
    vim.keymap.set('n', '<leader>tv' .. i, function()
        vim.cmd(i .. 'ToggleTerm direction=vertical')
    end, { desc = "Toggle terminal #" .. i .. " (vertical)" })
end
