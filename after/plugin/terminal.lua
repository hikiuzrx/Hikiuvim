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
    size = 15,
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

-- ====================================
-- 4️⃣ Terminal keymaps
-- ====================================
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }

    -- Basic escape
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)

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
