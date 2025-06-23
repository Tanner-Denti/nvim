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
			ensure_installed = { "ts_ls", "lua_ls", "pylsp", "gopls" },
		},
	},
}
