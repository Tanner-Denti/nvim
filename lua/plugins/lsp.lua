-- See none-ls.lua for linters and formatters
return {   
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({})
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        }
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.bashls.setup({ capabilities = capabilities })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
            lspconfig.dockerls.setup({ capabilities = capabilities })
            lspconfig.gopls.setup({ capabilities = capabilities })
            lspconfig.gradle_ls.setup({ capabilities = capabilities })
            lspconfig.groovyls.setup({ capabilities = capabilities })
            lspconfig.helm_ls.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.jdtls.setup({ capabilities = capabilities })
            lspconfig.jsonls.setup({ capabilities = capabilities })
            lspconfig.ast_grep.setup({ capabilities = capabilities })
            lspconfig.grammarly.setup({ capabilities = capabilities })
            lspconfig.pylsp.setup({ capabilities = capabilities })
            lspconfig.sqlls.setup({ capabilities = capabilities })
            lspconfig.terraformls.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            lspconfig.vimls.setup({ capabilities = capabilities })
            lspconfig.lemminx.setup({ capabilities = capabilities })
            lspconfig.yamlls.setup({ capabilities = capabilities })
            lspconfig.lua_ls.setup({ capabilities = capabilities }) 

            vim.keymap.set('n', '<leader>e', vim.lsp.buf.hover, {})
            vim.keymap.set({'n', 'v'}, '<leader>gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}
