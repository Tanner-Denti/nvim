vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opts = { noremap = true, silent = true }
-- Open a terminal in a new tab
vim.api.nvim_set_keymap("n", "<leader>t", ":tab term<CR>", opts)
-- Switch to the "next" tab
vim.api.nvim_set_keymap("n", "<leader>nt", ":tabn<CR>", opts)

vim.api.nvim_set_keymap("t", "<C-n>", "<C-\\><C-n>:BufferLineCycleNext<CR>", opts)

-- Move line up or down 1
vim.api.nvim_set_keymap("n", "<leader>mj", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("n", "<leader>mk", ":m .-2<CR>==", opts)

-- Move highlighted group up or down
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Pull next line with text up
vim.api.nvim_set_keymap("n", "J", "mzJ`z", opts)

-- Move up and down while centered
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts)
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", opts)

-- Move cursor while centered to next or prev (really nice when searching words with /word)
vim.api.nvim_set_keymap("n", "n", "nzzzv", opts)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts)

-- Paste over highlighted word without copying the highlighted word to vim register
vim.api.nvim_set_keymap("x", "<leader>p", "\"_dP", opts)

-- Copy to system clipboard (register)
vim.api.nvim_set_keymap("n", "<leader>y", "\"+y", opts)
vim.api.nvim_set_keymap("v", "<leader>y", "\"+y", opts)
vim.api.nvim_set_keymap("n", "<leader>Y", "\"+Y", opts)

-- Paste from system register
vim.api.nvim_set_keymap("n", "<leader>p", "\"+p", opts)
vim.api.nvim_set_keymap("i", "<C-v>", "<C-r>+", opts)

-- Delete to void register
vim.api.nvim_set_keymap("n", "<leader>d", "\"_d", opts)
vim.api.nvim_set_keymap("v", "<leader>d", "\"_d", opts)

-- Never press Q
vim.api.nvim_set_keymap("n", "Q", "<nop>", opts)

-- Quick fix navigation
vim.api.nvim_set_keymap("n", "<leader>qf", ":copen<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<leader>qk", "<cmd>lnext<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<leader>qj", "<cmd>lprev<CR>zz", opts)

-- Rename this word in the buffer
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- This section is for golang errors
vim.keymap.set(
    "n",
    "<leader>gee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set(
    "n",
    "<leader>gea",
    "oassert.NoError(err, \"\")<Esc>F\";a"
)

vim.keymap.set(
    "n",
    "<leader>gef",
    "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
)

vim.keymap.set(
    "n",
    "<leader>gel",
    "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
)

