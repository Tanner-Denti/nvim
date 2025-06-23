local opts = require("config.utils").opts

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Open a terminal in a new tab
vim.api.nvim_set_keymap("n", "<leader>t", ":tab term<CR>", opts(true, true, "(:tab term<CR>) Open terminal in new tab"))
-- Switch to the "next" tab
vim.api.nvim_set_keymap("n", "<leader>nt", ":tabn<CR>", opts(true, true, "(:tabn<CR>) Switch to next tab"))
vim.api.nvim_set_keymap(
	"t",
	"<C-n>",
	"<C-\\><C-n>:BufferLineCycleNext<CR>",
	opts(true, true, "(<C-\\><C-n>:BufferLineCycleNext<CR>) Next buffer from terminal")
)

-- Move line up or down 1
vim.api.nvim_set_keymap("n", "<leader>mj", ":m .+1<CR>==", opts(true, true, "(:m .+1<CR>==) Move current line down"))
vim.api.nvim_set_keymap("n", "<leader>mk", ":m .-2<CR>==", opts(true, true, "(:m .-2<CR>==) Move current line up"))

-- Move highlighted group up or down
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", opts(true, true, "(:m '>+1<CR>gv=gv) Move selected lines down"))
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", opts(true, true, "(:m '<-2<CR>gv=gv) Move selected lines up"))

-- Pull next line with text up
vim.api.nvim_set_keymap("n", "J", "mzJ`z", opts(true, true, "(mzJ`z) Join line below keeping cursor position"))

-- Move up and down while centered
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts(true, true, "(<C-d>zz) Scroll down half page centered"))
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", opts(true, true, "(<C-u>zz) Scroll up half page centered"))

-- Move cursor while centered to next or prev (really nice when searching words with /word)
vim.api.nvim_set_keymap("n", "n", "nzzzv", opts(true, true, "(nzzzv) Next search result centered"))
vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts(true, true, "(Nzzzv) Previous search result centered"))

-- Paste over highlighted word without copying the highlighted word to vim register
vim.api.nvim_set_keymap("x", "<leader>p", '"_dP', opts(true, true, '("_dP) Paste over selection without yanking'))

-- Copy to system clipboard (register)
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', opts(true, true, '("+y) Copy to system clipboard'))
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', opts(true, true, '("+y) Copy selection to system clipboard'))
vim.api.nvim_set_keymap("n", "<leader>Y", '"+Y', opts(true, true, '("+Y) Copy entire line to system clipboard'))

-- Paste from system register
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', opts(true, true, '("+p) Paste from system clipboard'))
vim.api.nvim_set_keymap("i", "<C-v>", "<C-r>+", opts(true, true, "(<C-r>+) Paste system clipboard in insert mode"))

-- Delete to void register
vim.api.nvim_set_keymap("n", "<leader>d", '"_d', opts(true, true, '("_d) Delete without copying to register'))
vim.api.nvim_set_keymap("v", "<leader>d", '"_d', opts(true, true, '("_d) Delete selection without copying'))

-- Never press Q
vim.api.nvim_set_keymap("n", "Q", "<nop>", opts(true, true, "(<nop>) Disabled ex mode"))

-- Quick fix navigation
vim.api.nvim_set_keymap("n", "<leader>qf", ":copen<CR>", opts(true, true, "(:copen<CR>) Open quickfix window"))
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts(true, true, "(<cmd>cnext<CR>zz) Next quickfix item"))
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts(true, true, "(<cmd>cprev<CR>zz) Previous quickfix item"))
vim.api.nvim_set_keymap(
	"n",
	"<leader>qk",
	"<cmd>lnext<CR>zz",
	opts(true, true, "(<cmd>lnext<CR>zz) Next location list item")
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>qj",
	"<cmd>lprev<CR>zz",
	opts(true, true, "(<cmd>lprev<CR>zz) Previous location list item")
)

-- Rename this word in the buffer
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	opts(
		true,
		true,
		"(:%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>) Find and replace word under cursor globally"
	)
)

-- This section is for golang errors
vim.keymap.set(
	"n",
	"<leader>gee",
	"oif err != true {<CR>}<Esc>Oreturn err<Esc>",
	opts(true, true, "(oif err != true {<CR>}<Esc>Oreturn err<Esc>) Insert return error block")
)

vim.keymap.set(
	"n",
	"<leader>gea",
	'oassert.NoError(err, "")<Esc>F";a',
	opts(true, true, '(oassert.NoError(err, "")<Esc>F";a) Insert assert no error test')
)

vim.keymap.set(
	"n",
	"<leader>gef",
	'oif err != true {<CR>}<Esc>Olog.Fatalf("error: %s\\n", err.Error())<Esc>jj',
	opts(
		true,
		true,
		'(oif err != true {<CR>}<Esc>Olog.Fatalf("error: %s\\n", err.Error())<Esc>jj) Insert fatal error logging'
	)
)

vim.keymap.set(
	"n",
	"<leader>gel",
	'oif err != true {<CR>}<Esc>O.logger.Error("error", "error", err)<Esc>F.;i',
	opts(
		true,
		true,
		'(oif err != true {<CR>}<Esc>O.logger.Error("error", "error", err)<Esc>F.;i) Insert logger error handling'
	)
)
