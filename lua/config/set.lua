local opts = {noremap = true, silent = true}

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
end, opts)

vim.keymap.set('n', '<Leader>h', '<C-w>h', opts)
vim.keymap.set('n', '<Leader>j', '<C-w>j', opts)
vim.keymap.set('n', '<Leader>k', '<C-w>k', opts)
vim.keymap.set('n', '<Leader>l', '<C-w>l', opts)
vim.keymap.set('n', '<Leader>nw', '<C-w>w', opts)

vim.keymap.set('t', '<Leader>h', '<C-\\><C-n><C-w>h', opts)
vim.keymap.set('t', '<Leader>j', '<C-\\><C-n><C-w>j', opts)
vim.keymap.set('t', '<Leader>k', '<C-\\><C-n><C-w>k', opts)
vim.keymap.set('t', '<Leader>l', '<C-\\><C-n><C-w>l', opts)
vim.keymap.set('t', '<Leader>nw', '<C-\\><C-n><C-w>w', opts)

vim.keymap.set('n', '<Leader>cw', function()
    vim.cmd('close')
end, opts)

vim.keymap.set('t', '<Leader>cw', function()
    vim.cmd('close')
end, opts)

vim.api.nvim_set_keymap("t", "<leader>nb", "<C-\\><C-n>:BufferLineCycleNext<CR>", opts)
