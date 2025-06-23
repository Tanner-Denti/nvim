-- Formatter
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>bf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "(conform.format) Format current buffer",
        },
    },
    config = function()
        local opts = require("config.utils").opts
        
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                json = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                markdown = { "prettier" },
                yaml = { "prettier" },
                sh = { "shfmt" },
                bash = { "shfmt" },
                go = { "gofumpt", "goimports" },
                java = { "google-java-format" },
                c = { "clang-format" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })
    end,
}
