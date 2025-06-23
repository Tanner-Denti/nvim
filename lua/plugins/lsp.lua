-- See none-ls.lua for linters and formatters
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
			lspconfig.dockerls.setup({ capabilities = capabilities })
			lspconfig.eslint.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- Disable diagnostics completely for ESLint
					client.server_capabilities.diagnosticProvider = false

					-- Keep other LSP features
					-- Go to definition, references, etc. will still work
				end,
				-- Disable diagnostic publishing
				handlers = {
					["textDocument/publishDiagnostics"] = function() end,
				},
			})
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
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"typescriptreact",
					"typescript",
				},
				init_options = {
					preferences = {
						["output.reverseAttributes"] = true, -- So given attributes like 'for' and 'href' don't come first.
					},
				},
			})

			local opts = require("config.utils").opts

			vim.keymap.set(
				{ "n", "v" },
				"<leader>e",
				vim.lsp.buf.hover,
				opts(true, true, "(vim.lsp.buf.hover) Show hover information")
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>rn",
				vim.lsp.buf.rename,
				opts(true, true, "(vim.lsp.buf.rename) Rename symbol under cursor")
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>gd",
				vim.lsp.buf.definition,
				opts(true, true, "(vim.lsp.buf.definition) Go to definition")
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>gt",
				vim.lsp.buf.type_definition,
				opts(true, true, "(vim.lsp.buf.type_definition) Go to type definition")
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>gr",
				vim.lsp.buf.references,
				opts(true, true, "(vim.lsp.buf.references) Show references")
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>gi",
				vim.lsp.buf.implementation,
				opts(true, true, "(vim.lsp.buf.implementation) Go to implementation")
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				opts(true, true, "(vim.lsp.buf.code_action) Show code actions")
			)

			-- vim.keymap.set(
			-- 	"n",
			-- 	"<leader>bf",
			-- 	vim.lsp.buf.format,
			-- 	opts(true, true, "(vim.lsp.buf.format) Format current buffer")
			-- )
		end,
	},
}
