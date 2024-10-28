vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opts = { noremap = true, silent = true }
-- Open a terminal in a new tab
vim.api.nvim_set_keymap("n", "<leader>t", ":tab term<CR>", opts)
-- Switch to the "next" tab
vim.api.nvim_set_keymap("n", "<leader>nt", ":tabn<CR>", opts)

