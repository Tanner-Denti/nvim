return {
	cmd = { "emmet-language-server", "--stdio" },
	filetypes = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"typescriptreact",
		"typescript",
	},
	root_markers = { "package.json", ".git" },
	init_options = {
		preferences = {
			["output.reverseAttributes"] = true, -- So given attributes like 'for' and 'href' don't come first.
		},
	},
	settings = {},
}
