require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99
