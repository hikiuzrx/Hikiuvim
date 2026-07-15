local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
local mason_lsp = require("mason-lspconfig")
local uv = vim.loop

require("mason").setup()
mason_lsp.setup({
    ensure_installed = {
        "clangd", "gopls", "pyright", "ts_ls", "jdtls",
        "lua_ls", "html", "cssls", "emmet_ls", "dockerls",
        "yamlls", "prismals", "sqls", "zls"
    },
    handlers = {
        function(server_name)
            local opts = { capabilities = capabilities }

            if server_name == "pyright" then
                local venv_path = vim.fn.getcwd() .. "/.venv/bin/python3"
                if uv.fs_stat(venv_path) then
                    opts.settings = { python = { pythonPath = venv_path } }
                end
            end

            if server_name == "zls" then
                opts.settings = {
                    zls = {
                        enable_inlay_hints = true,
                        enable_snippets = true,
                        warn_style = true,
                    }
                }
            end

            lspconfig[server_name].setup(opts)
        end,
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', 'K',           vim.lsp.buf.hover,        opts)
        vim.keymap.set('n', 'gd',          vim.lsp.buf.definition,   opts)
        vim.keymap.set('n', 'gr',          vim.lsp.buf.references,   opts)
        vim.keymap.set('n', '<leader>rn',  vim.lsp.buf.rename,       opts)
        vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>d',   vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d',          vim.diagnostic.goto_prev,  opts)
        vim.keymap.set('n', ']d',          vim.diagnostic.goto_next,  opts)
    end,
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false, -- don't re-render diagnostics on every keystroke
    severity_sort = true,
})
