local status, ts = pcall(require, "nvim-treesitter.configs") -- Note: .configs is the standard entry point
if not status then return end

-- 1. Setup the Parser Path
local parser_path = vim.fn.stdpath("config") .. "/parsers"

-- Ensure the directory exists so Neovim doesn't complain
if vim.fn.isdirectory(parser_path) == 0 then
    vim.fn.mkdir(parser_path, "p")
end

-- Prepend before setup(): ensure_installed only counts a parser as installed
-- if it's on the runtimepath, otherwise it re-downloads all of them.
vim.opt.runtimepath:prepend(parser_path)

-- 2. Configuration
ts.setup {
    -- Tell TS where to find/install everything
    parser_install_dir = parser_path,

    -- A balanced list of languages for a pro developer
    ensure_installed = {
        "lua", "vimdoc", "javascript", "typescript",
        "python", "rust", "go", "html", "css", "tsx",
        "markdown", "markdown_inline", "json", "bash", "vim",
        "yaml"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Don't download parsers when opening a buffer: it blocks on network
    -- errors when GitHub is unreachable. Install explicitly with :TSInstall.
    auto_install = false,

    highlight = {
        enable = true,
        -- Set to false so Treesitter is the ONLY source of truth for colors
        -- This is critical for preventing the "double-highlight" flicker
        additional_vim_regex_highlighting = false, 
    },
    
    indent = { 
        enable = true 
    },

    -- Enable incremental selection (Very useful for code navigation)
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<M-space>",
        },
    },
}
