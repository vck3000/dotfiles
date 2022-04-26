require('nvim-treesitter.configs').setup({
  ensure_installed = { 
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "comment",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "graphql",
    "haskell",
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "julia",
    "kotlin",
    "latex",
    "llvm",
    "lua",
    "make",
    "markdown",
    "ninja",
    "perl",
    "php",
    "prisma",
    "python",
    "query",
    "regex",
    "ruby",
    "rust",
    "scss",
    "solidity",
    "svelte",
    "typescript",
    "verilog",
    "vim",
    "vue",
    "yaml",
  },
  sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99
