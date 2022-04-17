require('telescope').setup {}
require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap('n', '<C-P>', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ps', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
