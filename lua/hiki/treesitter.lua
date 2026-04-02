local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then return end

-- Match the path we set in init.lua
local parser_path = vim.fn.stdpath("config") .. "/parsers"

-- FORCE Treesitter to recognize this path for the health check
vim.opt.runtimepath:prepend(parser_path)

ts.setup {
    -- IMPORTANT: This must be the first line in setup
    install_dir = parser_path, 
    
    ensure_installed = { 
        "lua", "vimdoc", "javascript", "typescript", 
        "python", "rust", "go", "html", "css", "tsx" 
    },

    highlight = {
        enable = true,
        -- Set this to false to ensure Treesitter takes full control
        additional_vim_regex_highlighting = false, 
    },
    
    indent = { enable = true },
}

-- Point the actual parser logic to the new directory
vim.api.nvim_set_option_value("runtimepath", parser_path .. "," .. vim.api.nvim_get_option_value("runtimepath", {}), {})
