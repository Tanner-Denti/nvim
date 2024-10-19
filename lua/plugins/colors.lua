return {

    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
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
        lazy = true,
        name = "onenord",
        config = function()
            require("onenord").setup({})
        end,
    },
    
    {
        "AlexvZyl/nordic.nvim",
        name = "nordic",
        config = function()
            local nord_colors = require('nordic.colors')
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
            vim.cmd.colorscheme("nordic")
            
        end,
    },
    
    {
        "rose-pine/neovim",
        name = "rose-pine",
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
