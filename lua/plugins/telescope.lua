return {

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},

		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "vertical",

					layout_config = {
						horizontal = {
							preview_width = 100,
						},
						vertical = {
							width = 100,
							height = 30,
						},
					},
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				},
			})

			local builtin = require("telescope.builtin")
			local opts = require("config.utils").opts

			vim.keymap.set(
				"n",
				"<leader>pf",
				builtin.find_files,
				opts(true, true, "(builtin.find_files) Telescope find files")
			)
			vim.keymap.set(
				"n",
				"<leader>ps",
				builtin.live_grep,
				opts(true, true, "(builtin.live_grep) Telescope live grep")
			)
			vim.keymap.set(
				"n",
				"<leader>gf",
				builtin.git_files,
				opts(true, true, "(builtin.git_files) Telescope git files")
			)
			vim.keymap.set("n", "<leader>pws", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end, opts(true, true, "(builtin.grep_string + <cword>) Search for word under cursor"))
			vim.keymap.set("n", "<leader>pWs", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end, opts(true, true, "(builtin.grep_string + <cWORD>) Search for WORD under cursor"))
			vim.keymap.set(
				"n",
				"<leader>th",
				builtin.help_tags,
				opts(true, true, "(builtin.help_tags) Telescope help tags")
			)
			vim.keymap.set("n", "<leader>ct", function()
				builtin.colorscheme({
					colors = {
						"rose-pine",
						"nordic",
						"monokai-pro",
						"kanagawa",
						"onenord",
					},
					enable_preview = true,
					ignore_builtins = true,
				})
			end, opts(true, true, "(builtin.colorscheme) Telescope colorscheme picker"))
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		event = "VeryLazy",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
