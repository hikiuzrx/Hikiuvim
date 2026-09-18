local dashboard = require("alpha.themes.dashboard")

-- Poimandres / HIKIUVIM Minimalist Header
dashboard.section.header.val = {
    [[                                                              ]],
    [[  ██╗  ██╗██╗██╗  ██╗██╗██╗   ██╗██╗   ██╗██╗███╗   ███╗      ]],
    [[  ██║  ██║██║██║ ██╔╝██║██║   ██║██║   ██║██║████╗ ████║      ]],
    [[  ███████║██║█████╔╝ ██║██║   ██║██║   ██║██║██╔████╔██║      ]],
    [[  ██╔══██║██║██╔═██╗ ██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║      ]],
    [[  ██║  ██║██║██║  ██╗██║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║      ]],
    [[  ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝      ]],
    [[                                                              ]],
    [[                -- System Ready, HIKIUVIM --                  ]],
}

-- 1. Poimandres Color Integration
-- Header: Use 'Special' (Pink/Blue glow) or 'Function' (Blue)
dashboard.section.header.opts.hl = "Special" 

-- 2. Modern Menu Buttons (Matching your workflow)
dashboard.section.buttons.val = {
    dashboard.button("f", "󰈞  FIND FILES", ":Telescope find_files <CR>"),
    dashboard.button("p", "󰊄  SEARCH TEXT", ":Telescope live_grep <CR>"),
    dashboard.button("r", "󰄉  RECENT", ":Telescope oldfiles <CR>"),
    dashboard.button("v", "󰙅  EXPLORER", ":NvimTreeToggle <CR>"),
    dashboard.button("c", "󰒓  CONFIG", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", "󰗼  EXIT", ":qa<CR>"),
}

-- Apply Poimandres Teal (String) to Icons and Pink (Number) to Hotkeys
for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "String"
    button.opts.hl_shortcut = "Number"
end

-- 3. Footer info
dashboard.section.footer.val = "⚡ HIKIUVIM Engine | " .. #vim.api.nvim_list_runtime_paths() .. " components"
dashboard.section.footer.opts.hl = "Comment"

-- Avoid a known alpha-nvim crash ("Invalid window id") where its WinResized
-- autocmd redraws using a stale cached window handle after splits/terminals
-- open and close around the dashboard.
dashboard.opts.opts.redraw_on_resize = false

require('alpha').setup(dashboard.opts)

vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
        local alpha_buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                if vim.api.nvim_get_current_buf() ~= alpha_buf
                    and vim.bo.buftype == ""
                    and vim.fn.bufname() ~= "" then
                    if vim.api.nvim_buf_is_valid(alpha_buf) then
                        vim.api.nvim_buf_delete(alpha_buf, { force = true })
                    end
                    return true -- remove this autocmd
                end
            end,
        })
    end,
})
