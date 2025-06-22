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
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>', { silent = true })
vim.keymap.set('n', '<leader>>', ':vertical resize +5<CR>', { silent = true })
vim.keymap.set('n', '<leader><', ':vertical resize -5<CR>', { silent = true })

vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)

vim.keymap.set('n', '<Leader>cw', function()
    vim.cmd('close')
end, opts)

vim.keymap.set('t', '<C-t>', function()
    vim.cmd('close')
end, opts)

