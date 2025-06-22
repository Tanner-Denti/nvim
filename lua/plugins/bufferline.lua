function CloseBuffer()
	local buftype = vim.api.nvim_buf_get_option(0, "buftype")
	if buftype == "terminal" then
		vim.cmd("bd!")
	else
		require("bufdelete").bufdelete(0, false)
	end
end

return {
	{
		"famiu/bufdelete.nvim",
		config = function() end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					close_command = require("bufdelete").bufdelete,
				},
			})

			local opts = { noremap = true, silent = true }
			-- Switch to the "next" open buffer
			vim.api.nvim_set_keymap("n", "<leader>nb", ":BufferLineCycleNext<CR>", opts)
			-- vim.api.nvim_set_keymap("t", "<C-nb>", "<C-\\><C-n>:BufferLineCycleNext<CR>", opts)
			-- Switch to the "previous" open buffer
			vim.api.nvim_set_keymap("n", "<leader>pb", ":BufferLineCyclePrev<CR>", opts)
			-- vim.api.nvim_set_keymap("t", "<C-pb>", "<C-\\><C-n>:BufferLineCyclePrev<CR>", opts)
			-- Close the current buffer in normal or terminal mode
			vim.api.nvim_set_keymap("n", "<C-x>", ":lua CloseBuffer()<CR>", opts)
			vim.api.nvim_set_keymap("t", "<C-x>", "<C-\\><C-n>:bd!<CR>", opts)
		end,
	},
}
