HOME = vim.fn.expand('$HOME')

-- vim.opt.noerrorbells = true          -- No sound on error
vim.opt.tabstop = 2                     -- Tab width
vim.opt.softtabstop = 2                 -- Tab width
vim.opt.shiftwidth = 2                  -- Tab amount
vim.opt.expandtab = true                -- Expand tabs into spaces 
vim.opt.nu = true                       -- Set line numbers
vim.opt.wrap = false                    -- Don't wrap lines
vim.opt.ignorecase = true               -- Required for the next command
vim.opt.smartcase = true                -- Try to do case sensitive searching unless I use uppercase
-- vim.opt.noswapfile = true               -- No swap files in the project
-- vim.opt.nobackup = true              -- Don't keep backup because of undo directory
vim.opt.undodir = HOME .. '/.vim/undodir'      -- Keep track of changes in a specific folder
vim.opt.undofile = true                 -- Tell vim to keep track of a separate undo file for each file
vim.opt.incsearch = true                -- Incremental search
vim.opt.showcmd = true                  -- Show what command is being typed out
vim.opt.relativenumber = true           -- Relative line numbers
vim.opt.hls = true                      -- highlight search terms
vim.opt.encoding = 'utf8'
vim.opt.hidden = true                   -- TODO Look into this
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16
vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}

vim.opt.smartindent = true              -- Try to indent for me

vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.updatetime = 300
