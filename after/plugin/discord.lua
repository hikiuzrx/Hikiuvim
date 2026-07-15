require("presence").setup({
    -- Client options
    auto_update         = true,
    neovim_image_text   = "The One True Editor",
    main_image          = "file",                     -- "neovim" or "file"
    
    -- Rich Presence text options
    editing_text        = "Editing %s",               -- e.g. "Editing init.lua"
    file_explorer_text  = "Browsing %s",              -- e.g. "Browsing NvimTree"
    git_commit_text     = "Committing changes",
    plugin_manager_text = "Managing plugins",
    reading_text        = "Reading %s",
    workspace_text      = "Working on %s",            -- Shows project name
    line_number_text    = "Line %s out of %s",
})
