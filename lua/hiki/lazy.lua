local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Core
    "nvim-lua/plenary.nvim",

    -- Theme (must load first)
    { "olivercederborg/poimandres.nvim", lazy = false, priority = 1000 },
    { "nvim-tree/nvim-web-devicons",     lazy = true },

    -- Dashboard
    { "goolord/alpha-nvim",              dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- Status line
    { "nvim-lualine/lualine.nvim",       dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- Indent guides (pinned to v2 API used in your config)
    { "lukas-reineke/indent-blankline.nvim", tag = "v2.20.8" },

    -- Search & Navigation
    {
        "nvim-telescope/telescope.nvim",
        branch = "master",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- LSP stack
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Completion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Utilities
    "mbbill/undotree",
    "windwp/nvim-autopairs", -- vim-closer removed: conflicts with nvim-autopairs

    -- Discord
    "andweeb/presence.nvim",

    -- Git
    "lewis6991/gitsigns.nvim",
    "tpope/vim-fugitive",

    -- Terminal
    { "akinsho/toggleterm.nvim", version = "*" },
}, {
    ui = { border = "rounded" },
})
