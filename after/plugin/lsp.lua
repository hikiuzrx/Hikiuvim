-- ~/.config/nvim/after/plugin/lsp.lua

-- 1️⃣ Setup completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 2️⃣ Setup Mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",
        "gopls",
        "pyright",
        "ts_ls",
        "jdtls",
        "lua_ls",
        "html",
        "cssls",
        "emmet_ls",
        "dockerls",
        "yamlls",
        "prismals",
        "sqls",
    },
})

-- 3️⃣ Setup LSP servers using lspconfig (still supported)
local lspconfig = require('lspconfig')

local servers = {
    "clangd", "gopls", "pyright", "ts_ls", "jdtls",
    "lua_ls", "html", "cssls", "emmet_ls", "dockerls",
    "yamlls", "prismals", "sqls"
}

for _, lsp in ipairs(servers) do
    if lspconfig[lsp] then
        lspconfig[lsp].setup({
            capabilities = capabilities,
        })
    end
end

-- 4️⃣ Common LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, opts)

        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    end,
})

-- 5️⃣ Diagnostic UI
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})
