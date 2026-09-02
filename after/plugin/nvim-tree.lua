-- nvim-tree.lua
-- ==============================

require("nvim-tree").setup({
    -- 1️⃣ Tree view settings
    view = {
        width = 30,
        relativenumber = true,
        side = "left",
    },

    -- 2️⃣ Show hidden files (including .env)
    filters = {
        dotfiles = false, -- false = show dotfiles like .env; true = hide them
        custom = {},
    },

    -- 3️⃣ Git integration
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },

    -- 4️⃣ Renderer / icons
    renderer = {
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },

    -- 5️⃣ Actions
    actions = {
        use_system_clipboard = true, -- Copy/paste with system clipboard
        change_dir = {
            enable = true,
            global = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
        },
        expand_all = {
            max_folder_discovery = 300,
            exclude = {},
        },
    },

    -- 6️⃣ Update the focused file in tree
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },

    -- 7️⃣ Trash support (optional)
    trash = {
        cmd = "trash", -- Or "gio trash" depending on your OS
        require_confirm = true,
    },
})

-- ===================================
-- Keymaps
-- ===================================
local api = require("nvim-tree.api")

-- Toggle tree
vim.keymap.set("n", "<leader>pv", api.tree.toggle, { desc = "Toggle Nvim Tree" })

-- Refresh tree
vim.keymap.set("n", "<leader>pr", api.tree.reload, { desc = "Refresh Nvim Tree" })

-- Focus tree
vim.keymap.set("n", "<leader>pf", api.tree.focus, { desc = "Focus Nvim Tree" })

-- Open / Close / Collapse
vim.keymap.set("n", "<leader>po", api.node.open.edit, { desc = "Open File / Folder" })
vim.keymap.set("n", "<leader>pc", api.node.navigate.parent_close, { desc = "Close Folder" })

-- Create / Delete / Rename
vim.keymap.set("n", "<leader>pa", api.fs.create, { desc = "Create File/Folder" })
vim.keymap.set("n", "<leader>pd", api.fs.remove, { desc = "Delete File/Folder" })
-- NOTE: was <leader>prn, but <leader>pr (reload) is a prefix of it, which
-- forced a timeoutlen delay on reload. Moved to <leader>pR to remove the overlap.
vim.keymap.set("n", "<leader>pR", api.fs.rename, { desc = "Rename File/Folder" })

-- Copy / Cut / Paste
vim.keymap.set("n", "<leader>py", api.fs.copy.node, { desc = "Copy File/Folder" })
vim.keymap.set("n", "<leader>px", api.fs.cut, { desc = "Cut File/Folder" })
vim.keymap.set("n", "<leader>pp", api.fs.paste, { desc = "Paste File/Folder" })

-- System clipboard
-- NOTE: was <leader>ps, which collided with telescope's grep-search map.
-- telescope loads after nvim-tree (alphabetical after/plugin order), so it
-- silently won that binding. Moved here to <leader>pP to free the conflict.
vim.keymap.set("n", "<leader>pP", api.fs.copy.absolute_path, { desc = "Copy Absolute Path" })

-- Show hidden files toggle
vim.keymap.set("n", "<leader>ph", api.tree.toggle_hidden_filter, { desc = "Toggle Hidden Files" })
