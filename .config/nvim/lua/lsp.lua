-- LSP
local config = require("mappings").lsp_config

-- Looks like rust-analyzer, by design, doesn't support update_in_insert since 
-- it'd run too slowly.
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- require("lspconfig").rust_analyzer.setup(config())
require("rust-tools").setup({
  server = config()
})

