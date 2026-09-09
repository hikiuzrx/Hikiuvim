local cmp = require('cmp')

cmp.setup({
    completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged }, -- pop up as you type
        completeopt = 'menu,menuone,noselect',
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- Force open menu
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to pick
        ['<Tab>'] = cmp.mapping.select_next_item(),        -- Move Down
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),    -- Move Up
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- The most important source (Object properties)
        { name = 'luasnip' },  -- Snippets
    }, {
        { name = 'buffer' },   -- Words from the current file
        { name = 'path' },     -- File paths
    })
})
