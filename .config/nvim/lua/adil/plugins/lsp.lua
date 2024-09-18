return {
    'VonHeikemen/lsp-zero.nvim', branch = 'v4.x',
    dependencies = {
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {'L3MON4D3/LuaSnip'},
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        local lsp_attach = function(client, bufnr)

            local opts = {buffer = bufnr}
            vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover,
            {border = 'rounded'}
            )

            vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
            vim.lsp.handlers.signature_help,
            {border = 'rounded'}
            )

            vim.diagnostic.config({
                float = {
                    border = 'rounded',
                },
            })

            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
            vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
            vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end

        lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = lsp_attach,
            capabilities = require('cmp_nvim_lsp').default_capabilities()
        })


        require('mason').setup({})
        require('mason-lspconfig').setup({
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            }
        })
        local cmp = require('cmp')

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                {name = 'nvim_lsp'},
                {name = 'buffer'},
                {name = 'luasnip'},
            },
            snippet = {
                expand = function(args)
                    -- You need Neovim v0.10 to use vim.snippet
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<Tab>"] = cmp.mapping(function(fallback)
                    -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
                    if cmp.visible() then
                        local entry = cmp.get_selected_entry()
                        if not entry then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        end
                        cmp.confirm()
                    else
                        fallback()
                    end
                end, {"i","s",}),
            }),
        })
    end
}
