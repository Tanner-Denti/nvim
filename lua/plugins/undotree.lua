return {
    "mbbill/undotree",
    config = function()
        -- Configuration options
        vim.g.undotree_WindowLayout = 2          -- Layout: tree on left, diff on bottom
        vim.g.undotree_SplitWidth = 30           -- Width of undo tree window
        vim.g.undotree_DiffpanelHeight = 10      -- Height of diff panel
        vim.g.undotree_SetFocusWhenToggle = 1    -- Focus undotree when opened
        vim.g.undotree_ShortIndicators = 1       -- Use short time indicators
        vim.g.undotree_DiffAutoOpen = 1          -- Auto open diff panel
        vim.g.undotree_HighlightChangedText = 1  -- Highlight changed text in diff
        vim.g.undotree_HighlightSyntaxAdd = "DiffAdd"       -- Highlight color for additions
        vim.g.undotree_HighlightSyntaxChange = "DiffChange" -- Highlight color for changes
        vim.g.undotree_HighlightSyntaxDel = "DiffDelete"    -- Highlight color for deletions
        
        -- Keymaps
        vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle Undotree" })
        vim.keymap.set("n", "<leader>uf", ":UndotreeFocus<CR>", { desc = "Focus Undotree" })
    end,
}
