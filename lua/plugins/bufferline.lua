local opts = require("config.utils").opts

function CloseBuffer()
    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
    if buftype == "terminal" then
        vim.cmd("bd!")
    else
        require("bufdelete").bufdelete(0, false)
    end
end

return {
    {
        "famiu/bufdelete.nvim",
        config = function() end,
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup({
                options = {
                    close_command = require("bufdelete").bufdelete,
                },
            })
            -- Switch to the "next" open buffer
            vim.api.nvim_set_keymap(
                "n",
                "<leader>nb",
                ":BufferLineCycleNext<CR>",
                opts(true, true, "(:BufferLineCycleNext) Switch to next open buffer")
            )
            -- vim.api.nvim_set_keymap("t", "<C-nb>", "<C-\\><C-n>:BufferLineCycleNext<CR>", opts(true, true, "(<C-\\><C-n>:BufferLineCycleNext) Exit terminal and switch to next buffer"))
            -- Switch to the "previous" open buffer
            vim.api.nvim_set_keymap(
                "n",
                "<leader>pb",
                ":BufferLineCyclePrev<CR>",
                opts(true, true, "(:BufferLineCyclePrev) Switch to previous open buffer")
            )
            -- vim.api.nvim_set_keymap("t", "<C-pb>", "<C-\\><C-n>:BufferLineCyclePrev<CR>", opts(true, true, "(<C-\\><C-n>:BufferLineCyclePrev) Exit terminal and switch to previous buffer"))
            -- Close the current buffer in normal or terminal mode
            vim.api.nvim_set_keymap(
                "n",
                "<C-x>",
                ":lua CloseBuffer()<CR>",
                opts(true, true, "(:lua CloseBuffer()) Close current buffer intelligently")
            )
            vim.api.nvim_set_keymap(
                "t",
                "<C-x>",
                "<C-\\><C-n>:bd!<CR>",
                opts(true, true, "(<C-\\><C-n>:bd!) Force close terminal buffer")
            )
        end,
    },
}
