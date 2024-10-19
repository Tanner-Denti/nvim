return {

    {
        "hrsh7th/cmp-nvim-lsp", -- Nvim talks to lsp to pull addional snippets from lsp?
    },

    {
        "L3MON4D3/LuaSnip",        -- Populates the snippet window?
        dependencies = {
            "saadparwaiz1/cmp_luasnip", -- Completes the snippet (actually writes it in)?
            "rafamadriz/friendly-snippets", -- Gets us 'vs-code' style snippets
        },
        config = function() end,
    },
    
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                }, 
                window = {
                    --completion = cmp.config.window.bordered(),
                    completion = {
                        border = "rounded",
                        winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal",
                    },
                    
                    --documentation = cmp.config.window.bordered(),
                    documentation = {
                        winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocNormal",
                    },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
