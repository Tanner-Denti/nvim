-- Gives linters and formatters lsp like features
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- Lua
				-- null_ls.builtins.formatting.biome, -- JS, TS, JSON, GraphQL
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.pylint.with({
                    extra_args = {
                        "--disable=all",
                        "--enable=E,unused-import",
                    },
                }), -- Py
				null_ls.builtins.formatting.black, -- Py
				null_ls.builtins.formatting.shfmt, -- Bash
				null_ls.builtins.diagnostics.hadolint, -- Docker
				null_ls.builtins.formatting.gofumpt, -- Go
				null_ls.builtins.diagnostics.golangci_lint, -- Go
				null_ls.builtins.formatting.google_java_format, -- Java
				null_ls.builtins.diagnostics.semgrep.with({
					filetypes = { "java" },
				}), -- semgrep also lints for typscript, ruby, python, and go. Prevent the override.
				null_ls.builtins.diagnostics.sqlfluff.with({
					extra_args = { "--dialect", "postgres" }, --extra_args can be a function for extra logic
				}),
				null_ls.builtins.diagnostics.yamllint,
				null_ls.builtins.formatting.yamlfix,
				--null_ls.builtins.formatting.clang_format.with({
			    --		filetypes = { "c", "cpp" },
				--}),
			},
		})

		vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, {})
	end,
}
