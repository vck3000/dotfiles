-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o> and <C-space>
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-space>', '<c-x><c-o>', opts)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>D'   , '<cmd>lua vim.lsp.buf.declaration()<CR>'                                , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>gd'  , '<cmd>lua vim.lsp.buf.definition()<CR>'                                 , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>gD'  , '<cmd>lua vim.lsp.buf.type_definition()<CR>'                            , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>gi'  , '<cmd>lua vim.lsp.buf.implementation()<CR>'                             , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>gs'  , '<cmd>lua vim.lsp.buf.signature_help()<CR>'                             , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , 'K'           , '<cmd>lua vim.lsp.buf.hover()<CR>'                                      , opts)

  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>wa'  , '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'                       , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>wr'  , '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'                    , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>wl'  , '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>' , opts)

  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>rr'  , '<cmd>lua vim.lsp.buf.rename()<CR>'                                     , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>ga'  , '<cmd>lua vim.lsp.buf.code_action()<CR>'                                , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>gr'  , '<cmd>lua vim.lsp.buf.references()<CR>'                                 , opts)
  vim.api.nvim_buf_set_keymap(bufnr , 'n' , '<leader>gf'  , '<cmd>lua vim.lsp.buf.formatting()<CR>'                                 , opts)
end

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.settings({ log_level = vim.log.levels.DEBUG })

-- lsp_installer.on_server_ready(function (server) 
--   server:setup({ on_attach = on_attach })
-- end)

-- Capabilities of cmp auto completion
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Careful not to require lspconfig setup stuff that nvim lsp installer already configures above^
local servers = { 'tsserver', 'ccls', 'pyright' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
