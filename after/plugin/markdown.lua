-- ============================================================
--  Markdown: GitHub-style preview inside Neovim (no browser)
-- ------------------------------------------------------------
--  Three cooperating layers:
--    1. image.nvim    -> draws real images via the Kitty graphics
--                        protocol (needs Kitty + ImageMagick `magick`)
--    2. diagram.nvim  -> renders ```mermaid blocks into images
--                        (needs `mmdc` from @mermaid-js/mermaid-cli)
--    3. markview.nvim -> renders text/headings/tables/code in-buffer
--
--  image.nvim MUST be set up before diagram.nvim, so both live here
--  in one file to guarantee load order.
-- ============================================================

-- 1) Inline images (Kitty graphics protocol) ----------------------------
local ok_image, image = pcall(require, "image")
if ok_image then
    image.setup({
        backend = "kitty",         -- Kitty implements the graphics protocol natively
        processor = "magick_cli",  -- shell out to ImageMagick CLI (no luarocks needed)
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,   -- keep images visible while editing
                only_render_image_at_cursor = false,
                filetypes = { "markdown", "vimwiki" },
            },
        },
        window_overlap_clear_enabled = true,    -- hide images under floats/other windows
        tmux_show_only_in_active_window = true,  -- don't leak images across tmux windows
        max_width_window_percentage = 90,
    })
end

-- 2) Rendered diagrams (mermaid -> image), depends on image.nvim --------
local ok_diagram, diagram = pcall(require, "diagram")
if ok_diagram then
    diagram.setup({
        integrations = {
            require("diagram.integrations.markdown"),
        },
        renderer_options = {
            mermaid = {
                theme = "dark",            -- match the dark oxocarbon look
                background = "transparent",
                scale = 2,                 -- render at 2x for a crisper image
            },
        },
    })
end

-- 3) In-buffer GitHub-style text rendering ------------------------------
--  markview needs no setup() call; it renders markdown out of the box.
--  Toggle it with <leader>mp ("markdown preview").
vim.keymap.set(
    "n",
    "<leader>mp",
    "<cmd>Markview Toggle<cr>",
    { desc = "Markdown: toggle preview" }
)
