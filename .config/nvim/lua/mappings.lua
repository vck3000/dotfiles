vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeShow<CR>', { noremap = true }) -- TODO
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':noa w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':noh<CR>', { noremap = true }) -- Clear highlighting words after search
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true }) -- Yank to clipboard
vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<CR>', { noremap = true }) -- List buffers TODO Use telescope buffers

vim.api.nvim_set_keymap('n', '<C-L><C-L>',':set invrelativenumber<CR>', { noremap = true })

-- nnoremap <leader>ps :Rg<SPACE>

-- center highlighted search results
-- function _G.center_search()
--   local cmdtype = vim.fn.getcmdtype()
--   return cmdtype:match('^[/?]$') and utils.t('<CR>zz') or utils.t('<CR>')
-- end

-- vim.api.nvim_set_keymap('c', '<CR>', 'v:lua.center_search()', { expr = true, noremap = true })
vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true })
vim.api.nvim_set_keymap('n', '*', '*zz', { noremap = true })
vim.api.nvim_set_keymap('n', '#', '#zz', { noremap = true })

-- toggle spell check
vim.api.nvim_set_keymap('', '<F12>', ':setlocal spell! spelllang=en_au<CR>', { noremap = true })

-- Reload config
vim.api.nvim_set_keymap('n', '<leader>rl', ':source ~/.config/nvim/init.lua<CR>:PackerSync<CR>', { noremap = true })
