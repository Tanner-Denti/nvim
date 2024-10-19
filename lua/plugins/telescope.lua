return {

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_strategy = "vertical",

                    layout_config = {
                        horizontal = {
                            preview_width = 80,
                        },
                        vertical = {
                            width = 85,
                            height = 30,
                        },
                    },
                    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                },
            })

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git files" })
            vim.keymap.set("n", "<leader>pws", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set("n", "<leader>pWs", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Telescope help tags" })

            vim.keymap.set("n", "<leader>ct", function()
                builtin.colorscheme({
                    colors = {
                        "rose-pine",
                        "nordic",
                        "monokai-pro",
                        "kanagawa",
                        "onenord",
                    },
                    enable_preview = true,
                    ignore_builtins = true,
                })

            end, { desc = "Telescope Colorscheme Picker" })

        end,
    },

    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
