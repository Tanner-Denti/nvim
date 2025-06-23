local opts = require("config.utils").opts

-- Will use first terminal buffer in the buffer list or make a new one if none.
vim.keymap.set('n', '<Leader>st', function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == 'terminal' then
      vim.cmd('belowright split')
      vim.cmd('buffer ' .. buf)
      return
    end
  end

  vim.cmd('belowright split')
  vim.cmd('term')
end, opts(true, true, "(belowright split + term) Open existing terminal buffer or create new one in split"))

vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>h', opts(true, true, "(<C-w>h) Move to left window"))
vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w>j', opts(true, true, "(<C-w>j) Move to window below"))
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w>k', opts(true, true, "(<C-w>k) Move to window above"))
vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w>l', opts(true, true, "(<C-w>l) Move to right window"))
vim.api.nvim_set_keymap('n', '<leader>vs', ':vsplit<CR>', opts(true, true, "(:vsplit) Create vertical split"))
vim.api.nvim_set_keymap('n', '<leader>>', ':vertical resize +5<CR>', opts(true, true, "(:vertical resize +5) Increase vertical window size"))
vim.api.nvim_set_keymap('n', '<leader><', ':vertical resize -5<CR>', opts(true, true, "(:vertical resize -5) Decrease vertical window size"))

vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', opts(true, true, "(<C-\\><C-n><C-w>h) Exit terminal mode and move to left window"))
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', opts(true, true, "(<C-\\><C-n><C-w>k) Exit terminal mode and move to window above"))

-- For function-based keymaps, we need to use vim.keymap.set
vim.keymap.set('n', '<Leader>cw', function()
    vim.cmd('close')
end, opts(true, true, "(:close) Close current window"))

vim.keymap.set('t', '<C-t>', function()
    vim.cmd('close')
end, opts(true, true, "(:close) Close terminal window"))
