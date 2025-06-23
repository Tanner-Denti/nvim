return {
	"nvim-lualine/lualine.nvim",
	name = "lualine",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Lint status function
		local lint_progress = function()
			local linters = require("lint").get_running()
			if #linters == 0 then
				return "󰦕"
			end
			return "󱉶 " .. table.concat(linters, ", ")
		end

		require("lualine").setup({
			options = {
				theme = "onedark",
			},
			sections = {
				lualine_x = { lint_progress },
			},
		})
	end,
}
