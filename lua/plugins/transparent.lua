return {
	"xiyaowong/transparent.nvim",
	name = "transparent",
	lazy_load = false,
	config = function()
		require("transparent").setup({
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			-- table: additional groups that should be cleared
			extra_groups = {},
			-- table: groups you don't want to clear
			exclude_groups = {},
			-- function: code to be executed after highlight groups are cleared:
			-- Also the user event "TransparentClear" will be triggered
			on_clear = function() end,
		})

		local opts = require("config.utils").opts

		vim.api.nvim_set_keymap(
			"n",
			"<leader>tt",
			":TransparentToggle<CR>",
			opts(true, true, "(:TransparentToggle) Toggle transparent background")
		)
	end,
}
