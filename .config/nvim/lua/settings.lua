HOME = vim.fn.expand('$HOME')

-- vim.opt.guicursor = " "

vim.opt.nu = true
vim.opt.relativenumber = true

-- Mostly handled by tpope/vim-sleuth
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Search related
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.undodir = HOME .. '/.vim/undodir' -- Keep track of changes in a specific folder
vim.opt.undofile = true -- Tell vim to keep track of a separate undo file for each file

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

vim.opt.cmdheight = 2
vim.opt.laststatus = 2

-- vim.cmd("colorscheme tokyonight")
vim.cmd("colorscheme sonokai")

