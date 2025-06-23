return {

	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		lazy = true,
		config = function()
			require("kanagawa").setup({
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
				statementStyle = { bold = false },
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = {
						wave = {},
						lotus = {},
						dragon = {},
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function(colors) -- add/modify highlights
					local theme = colors.theme

					return {
						-- TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },

						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					}
				end,
				theme = "wave", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})
		end,
	},

	{
		"loctvl842/monokai-pro.nvim",
		name = "monokai-pro",
		lazy = true,
		config = function()
			require("monokai-pro").setup({
				transparent_background = false,
				terminal_colors = true,
				devicons = true, -- highlight the icons of `nvim-web-devicons`
				filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
				-- Enable this will disable filter option
				inc_search = "background", -- underline | background
				background_clear = {
					"telescope",
				},
			})
		end,
	},

	{
		"rmehri01/onenord.nvim",
		lazy = false,
		name = "onenord",
		config = function()
			require("onenord").setup({
				theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
				borders = true, -- Split window borders
				fade_nc = false, -- Fade non-current windows, making them more distinguishable
				-- Style that is applied to various groups: see `highlight-args` for options
				styles = {
					comments = "NONE",
					strings = "NONE",
					keywords = "NONE",
					functions = "NONE",
					variables = "NONE",
					diagnostics = "underline",
				},
				disable = {
					background = false, -- Disable setting the background color
					float_background = false, -- Disable setting the background color for floating windows
					cursorline = false, -- Disable the cursorline
					eob_lines = true, -- Hide the end-of-buffer lines
				},
				-- Inverse highlight for different groups
				inverse = {
					match_paren = false,
				},
				custom_highlights = {}, -- Overwrite default highlight groups
				custom_colors = {}, -- Overwrite default colors
			})

			vim.cmd.colorscheme("onenord")
		end,
	},

	{
		"AlexvZyl/nordic.nvim",
		name = "nordic",
		lazy = true,
		config = function()
			local nord_colors = require("nordic.colors")
			require("nordic").setup({
				bright_border = true,
				cursorline = {
					-- Bold cursorline number.
					bold_number = true,
					-- Available styles: 'dark', 'light'.
					theme = "light",
					-- Blending the cursorline bg with the buffer bg.
					blend = 0.85,
				},
				telescope = {
					-- Available styles: `classic`, `flat`.
					style = "classic",
				},
				-- nord_colors.
				custom_highlights = {
					-- Link LuaSnip highlights to 'Normal' to match the background and foreground
					LuaSnipInsertNode = { fg = nord_colors.black2, bg = nord_colors.black2 },
					LuaSnipChoiceNode = { fg = nord_colors.black2, bg = nord_colors.black2 },
					LuaSnipActiveChoice = { fg = nord_colors.black2, bg = nord_colors.black2 },
				},
			})
			-- vim.cmd.colorscheme("nordic")
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				styles = {
					italic = false,
					bold = false,
				},
				-- extend_background_behind_borders = false,
			})
		end,
	},
}
