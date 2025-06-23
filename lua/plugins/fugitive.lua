return {
	"tpope/vim-fugitive",
	config = function()
		local opts = require("config.utils").opts

		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, opts(true, true, "(vim.cmd.Git) Open Git status window"))
	end,
}
