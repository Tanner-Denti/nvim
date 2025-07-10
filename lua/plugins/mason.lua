-- See none-ls.lua for linters and formatters
return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
		config = function()
			require("mason").setup({
				ui = {
					check_outdated_packages_on_open = false,
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = { "ts_ls", "lua_ls", "pylsp", "gopls" },
		},
	},
}
