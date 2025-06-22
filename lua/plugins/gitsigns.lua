return {
    "lewis6991/gitsigns.nvim",
    config = function() 
        require('gitsigns').setup({})

        local function set_gitsigns_colors()
            vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#A3BE8C", bold = true })          -- Green
            vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#D08F70", bold = true })       -- Orange  
            vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#D57780", bold = true })       -- Red
            vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = "#D57780", bold = true })    -- Red
            vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#B988B0", bold = true }) -- Purple
            vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#6C7A96", bold = true })    -- Sky Blue
        end

        -- Apply colors immediately
        set_gitsigns_colors()

        -- Reapply colors when colorscheme changes
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = set_gitsigns_colors,
            desc = "Maintain consistent GitSigns colors across themes"
        })
    end,
}
