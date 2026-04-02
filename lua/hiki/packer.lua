vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- 1. Core & Package Management
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim' -- Required by many plugins
    
    -- 2. Theme & UI
    use { 'olivercederborg/poimandres.nvim' }
    use { 'nvim-tree/nvim-web-devicons' } -- Standard icons for everything
    
    -- Dashboard
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }

    -- Status Line (Lualine)
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require('lualine').setup() end
    }

     use {
  		'nvim-telescope/telescope.nvim',
  		branch = 'master', -- Change 0.1.x to master
  		requires = { {'nvim-lua/plenary.nvim'} }
	}	
    -- 3. File Navigation & Search
   use { 'ThePrimeagen/harpoon' }
    
    -- File Tree Sidebar (FIXED: Official repo is nvim-tree.lua)
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }

use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
use 'neovim/nvim-lspconfig'   
    -- Completion Engine
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'

    -- 5. Treesitter (Syntax Highlighting)
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } 

    -- 6. Utilities & Productivity
    use { 'mbbill/undotree' }
    use { 'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end }
    use { 'rstacruz/vim-closer' }
    use { "lukas-reineke/indent-blankline.nvim", tag = "v2.20.8" }     
    
    -- Discord Presence
    use 'andweeb/presence.nvim'

    -- 7. Git
    use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }
    use 'tpope/vim-fugitive'

    -- 8. Terminal
    use {
        "akinsho/toggleterm.nvim", 
        tag = '*', 
        config = function()
            require("toggleterm").setup()
        end
    }
end)
