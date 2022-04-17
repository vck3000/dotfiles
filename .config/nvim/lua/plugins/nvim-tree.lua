require'nvim-tree'.setup({
  git = { -- Disable git modified icons in the view panel
    enable = false,
  }
})

vim.api.nvim_set_keymap('n', '<leader>pv', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pf', ':NvimTreeFindFile<CR>', { noremap = true })
