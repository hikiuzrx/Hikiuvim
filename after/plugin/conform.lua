require("conform").setup({
    formatters_by_ft = {
        lua        = { "stylua" },
        go         = { "gofmt" },
        python     = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact  = { "prettier" },
        typescriptreact  = { "prettier" },
        json       = { "prettier" },
        css        = { "prettier" },
        html       = { "prettier" },
    },
    format_on_save = {
        timeout_ms   = 500,
        lsp_fallback = true,
    },
})
