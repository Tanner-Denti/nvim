return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()

		local opts = require("config.utils").opts

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, opts(true, true, "(harpoon:list():add) Add current file to harpoon list"))
		vim.keymap.set("n", "<leader>hi", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, opts(true, true, "(harpoon.ui:toggle_quick_menu) Toggle harpoon quick menu"))

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>nh", function()
			harpoon:list():prev()
		end, opts(true, true, "(harpoon:list():prev) Go to next harpoon mark"))
		vim.keymap.set("n", "<leader>ph", function()
			harpoon:list():next()
		end, opts(true, true, "(harpoon:list():next) Go to previous harpoon mark"))

		-- Direct navigation to specific harpoon marks
		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, opts(true, true, "(harpoon:list():select(1)) Go to harpoon mark 1"))
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, opts(true, true, "(harpoon:list():select(2)) Go to harpoon mark 2"))
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, opts(true, true, "(harpoon:list():select(3)) Go to harpoon mark 3"))
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, opts(true, true, "(harpoon:list():select(4)) Go to harpoon mark 4"))
	end,
}
