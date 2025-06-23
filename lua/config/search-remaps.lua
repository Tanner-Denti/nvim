local function my_keymaps_telescope()
	local ok, builtin = pcall(require, "telescope.builtin")
	if not ok then
		vim.notify("Telescope builtin not available", vim.log.levels.ERROR)
		return
	end

	builtin.keymaps({
		modes = { "n", "v", "t", "i" },
		show_plug = false,
		layout_config = {
			width = 0.65,
			height = 0.8,
			preview_cutoff = 120,
		},
		default_text = "",
	})
end

-- Create commands
vim.api.nvim_create_user_command("MyKeymaps", my_keymaps_telescope, {
	desc = "Show my keymaps in telescope",
})

-- Add keymaps
local opts = require("config.utils").opts

vim.keymap.set(
	"n",
	"<leader>km",
	my_keymaps_telescope,
	opts(true, true, "(my_keymaps_telescope) Show my custom keymaps in telescope")
)
-- Standard telescope keymaps (shows everything)
vim.keymap.set("n", "<leader>kma", function()
	require("telescope.builtin").keymaps({
		layout_config = {
			width = 0.65,
			height = 0.8,
			preview_cutoff = 120,
		},
	})
end, opts(true, true, "(telescope.builtin.keymaps) Show all keymaps in telescope"))
