local presence = require("presence")

presence.setup({
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

-- presence only looks up assets by exact filename or last extension, so
-- dockerfile.dev / docker-compose.dev.yml fall through to "dev" / "yml".
-- Catch those by pattern before the extension lookup happens.
local docker = { "Docker", "docker" }
local docker_patterns = {
    "^[Dd]ockerfile",                -- Dockerfile, dockerfile.dev, Dockerfile.prod
    "^[Cc]ontainerfile",
    "%.[Dd]ockerfile$",              -- dev.Dockerfile
    "^docker%-compose.*%.ya?ml$",    -- docker-compose.dev.yml
    "^compose[%.%-_].*%.ya?ml$",     -- compose.prod.yaml
}

setmetatable(presence.options.file_assets, {
    __index = function(_, name)
        if type(name) ~= "string" then return nil end
        for _, p in ipairs(docker_patterns) do
            if name:match(p) then return docker end
        end
    end,
})
