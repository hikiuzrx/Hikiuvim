-- nvim-web-devicons
-- ==============================
-- devicons only matches exact filenames/extensions, so variants like
-- Dockerfile.dev or docker-compose.dev.yml get no docker icon. We swap in
-- our own icon and map those variants onto it.

local devicons = require("nvim-web-devicons")

local docker = { icon = "\u{f308}", color = "#2496ED", cterm_color = "33", name = "Dockerfile" }

devicons.setup({
    override_by_filename = {
        ["dockerfile"] = docker,
        ["containerfile"] = docker,
        [".dockerignore"] = docker,
        ["docker-compose.yml"] = docker,
        ["docker-compose.yaml"] = docker,
        ["compose.yml"] = docker,
        ["compose.yaml"] = docker,
    },
    override_by_extension = {
        ["dockerfile"] = docker,
        ["dockerignore"] = docker,
    },
})

-- Lua patterns (matched against the lowercased basename) -> canonical name
local patterns = {
    { "^dockerfile[%.%-_].+", "dockerfile" },       -- Dockerfile.dev, Dockerfile.prod
    { "^containerfile[%.%-_].+", "containerfile" },
    { "^docker%-compose.*%.ya?ml$", "docker-compose.yml" }, -- docker-compose.dev.yml
    { "^compose[%.%-_].+%.ya?ml$", "compose.yml" },     -- compose.prod.yaml
}

local function normalize(name)
    if type(name) ~= "string" then
        return name
    end
    local lower = name:lower()
    for _, p in ipairs(patterns) do
        if lower:match(p[1]) then
            return p[2]
        end
    end
    return name
end

for _, fn in ipairs({ "get_icon", "get_icon_colors", "get_icon_color", "get_icon_cterm_color" }) do
    local orig = devicons[fn]
    devicons[fn] = function(name, ext, opts)
        local mapped = normalize(name)
        if mapped ~= name then
            ext = nil
        end
        return orig(mapped, ext, opts)
    end
end
