require('telescope').setup({
  defaults = {
    mappings = {
      n = {
        ['<c-d>'] = require('telescope.actions').delete_buffer,
        ['<c-u>'] = false,
      },
      i = {
        ['<c-d>'] = require('telescope.actions').delete_buffer,
        ['<c-u>'] = false,
      }
    }
  }
})
require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap('n', '<C-P>', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ps', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
