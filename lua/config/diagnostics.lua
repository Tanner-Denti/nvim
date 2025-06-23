vim.diagnostic.config({
	-- Show diagnostics in virtual text (inline with your code)
	virtual_text = {
		enabled = true,
		source = "always", -- Always show source for more context
		severity = { min = vim.diagnostic.severity.ERROR },
		prefix = "■",
	},

	-- Show diagnostics in floating windows on hover
	float = {
		enabled = true,
		source = "always", -- Show source
		border = "rounded",
		header = "Diagnostics:",
		prefix = function(diagnostic, i, total)
			local level = vim.diagnostic.severity[diagnostic.severity]
			return string.format("%d/%d [%s] ", i, total, level)
		end,
		-- Much more verbose format for floating windows
		format = function(diagnostic)
			local lines = {}

			-- Add severity and source
			local level = vim.diagnostic.severity[diagnostic.severity]
			local source = diagnostic.source or "unknown"
			table.insert(lines, string.format("Severity: %s", level))
			table.insert(lines, string.format("Source: %s", source))

			-- Add error code if available
			if diagnostic.code then
				table.insert(lines, string.format("Code: %s", diagnostic.code))
			end

			-- Add the main message
			table.insert(lines, "")
			table.insert(lines, string.format("Message: %s", diagnostic.message))

			-- Add location info
			if diagnostic.lnum and diagnostic.col then
				table.insert(
					lines,
					string.format("Location: Line %d, Column %d", diagnostic.lnum + 1, diagnostic.col + 1)
				)
			end

			-- Add related information if available
			if diagnostic.related_information then
				table.insert(lines, "")
				table.insert(lines, "Related Information:")
				for _, info in ipairs(diagnostic.related_information) do
					table.insert(lines, string.format("  - %s", info.message))
				end
			end

			return table.concat(lines, "\n")
		end,
		-- Make floating window larger to accommodate more text
		max_width = 80,
		max_height = 20,
	},

	-- Underline the problematic text
	underline = true,

	-- Update diagnostics in insert mode
	update_in_insert = false,
})

-- Keymaps for diagnostics navigation
local opts = require("config.utils").opts

-- Show diagnostics in floating window
vim.keymap.set(
	"n",
	"<leader>do",
	vim.diagnostic.open_float,
	opts(true, true, "(vim.diagnostic.open_float) Show diagnostic in floating window")
)

-- Show all diagnostics in quickfix list
vim.keymap.set(
	"n",
	"<leader>qfd",
	vim.diagnostic.setqflist,
	opts(true, true, "(vim.diagnostic.setqflist) Show all diagnostics in quickfix")
)
