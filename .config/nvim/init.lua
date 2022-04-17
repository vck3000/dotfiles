vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeShow<CR>', { noremap = true }) -- TODO
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':noa w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':noh<CR>', { noremap = true }) -- Clear highlighting words after search
vim.api.nvim_set_keymap('n', '<leader>y','"+y', { noremap = true }) -- Yank to clipboard
vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<CR>', { noremap = true }) -- List buffers TODO Use telescope buffers

vim.api.nvim_set_keymap('n', '<C-L><C-L>',':set invrelativenumber<CR>', { noremap = true })


-- TODO Telescope delete buffers from menu
-- TODO map leader d to delete buffer
-- TODO Vim peekaboo - see registers

-- nnoremap <leader>ps :Rg<SPACE>

-- Center the / search results
function _G.center_search()
  local cmdtype = vim.fn.getcmdtype()
  return cmdtype:match('^[/?]$') and utils.t('<CR>zz') or utils.t('<CR>')
end

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

-- Hillary's plugin init lua file
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print('Installing packer close and reopen Neovim...')
  vim.cmd([[packadd packer.nvim]])
end

return require('packer').startup(function()
  -- Let packer manage itself
  use('wbthomason/packer.nvim')

  use { 
    'sainnhe/sonokai', 
    config = function() 
      vim.g.sonokai_enable_italic = 1
      vim.cmd('colorscheme sonokai')
    end
  }

  use 'jremmen/vim-ripgrep' -- Fast vim grepping 
    -- TODO
    -- FZF search
    -- nnoremap <C-p> :GFiles<Cr>
    -- nnoremap <leader>o :Files<Cr>


  use 'tpope/vim-commentary' -- Easy comments
  use 'kana/vim-submode' -- submodes for resizing
    -- call submode#enter_with('grow/shrink', 'n', '', '<leader>J', '<C-w>+')
    -- call submode#enter_with('grow/shrink', 'n', '', '<leader>K', '<C-w>-')
    -- call submode#map('grow/shrink', 'n', '', 'J', '<C-w>+')
    -- call submode#map('grow/shrink', 'n', '', 'j', '<C-w>+')
    -- call submode#map('grow/shrink', 'n', '', 'K', '<C-w>-')
    -- call submode#map('grow/shrink', 'n', '', 'k', '<C-w>-')

    -- call submode#enter_with('grow/shrink', 'n', '', '<leader>L', '<C-w>>')
    -- call submode#enter_with('grow/shrink', 'n', '', '<leader>H', '<C-w><')
    -- call submode#map('grow/shrink', 'n', '', 'L', '<C-w>>')
    -- call submode#map('grow/shrink', 'n', '', 'l', '<C-w>>')
    -- call submode#map('grow/shrink', 'n', '', 'H', '<C-w><')
    -- call submode#map('grow/shrink', 'n', '', 'h', '<C-w><')

    -- don't consume submode-leaving key
    -- let g:submode_keep_leaving_key = 1


  use 'junegunn/goyo.vim' -- Distraction free writing

  -- Quality of life
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
  use 'alvan/vim-closetag'
  use 'tpope/vim-repeat'
  use 'psliwka/vim-smoothie'
  use 'ThePrimeagen/vim-be-good'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() 
      require'nvim-tree'.setup({
        git = { -- Disable git modified icons in the view panel
          enable = false,
        }
      })
      vim.api.nvim_set_keymap('n', '<leader>pv', ':NvimTreeToggle<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<leader>pf', ':NvimTreeFindFile<CR>', { noremap = true })
    end
  }

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      -- require('plugins.nvim-treesitter') -- For file splitting
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'maintained',
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      })
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
      vim.opt.foldlevelstart = 99
    end
    -- Treesitter helps with syntax highlighting
    -- Also helps neovim identify which sections of code are "foldable" for smart folding.
  })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function () 
      require('lualine').setup()
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function () 
      require('gitsigns').setup({
        yadm = {
          enable = true
        }
      })
    end
    -- tag = 'release' -- To use the latest release
  }

  -- use 'vim-airline/vim-airline' -- TODO Replace with lua airline
  -- use 'vim-airline/vim-airline-themes'

-- use 'morhetz/gruvbox' -- Color scheme
-- use 'tpope/vim-fugitive' -- For git integration - blames, diffs, logs...
-- use 'vim-utils/vim-man' -- See man pages from within vim
-- use 'junegunn/limelight.vim' -- Dims inactive paragraphs

-- use 'junegunn/fzf', { 'do': { -> fzf#install() } } -- fuzzy find 
-- use 'junegunn/fzf.vim'

-- use 'neoclide/coc.nvim', {'branch': 'release'}

-- use 'mbbill/undotree' -- Undo tree...
-- use 'ryanoasis/vim-devicons' -- For use with other plugins like nerdtree

-- Markdown
-- use 'godlygeek/tabular' -- https://github.com/junegunn/vim-easy-align
-- use 'plasticboy/vim-markdown' -- Markdown syntax
-- use 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
-- let g:mkdp_markdown_css = expand('~/.vim/github-markdown.css')
-- let g:mkdp_highlight_css = expand('~/.vim/gruvbox-dark.css')
-- let g:mkdp_auto_close = 0
--
-- autocmd FileType markdown :set wrap
-- autocmd FileType markdown :set linebreak
-- autocmd FileType tex :set spell

-- " Tex
-- autocmd FileType tex :set wrap
-- autocmd FileType tex :set linebreak
-- autocmd FileType tex :set spell

-- Plug 'pandysong/ghost-text.vim' " Linking with the browser ghost text

-- Javascript syntax highlighting
-- use 'pangloss/vim-javascript'
-- use 'leafgarland/typescript-vim'
-- use 'peitalin/vim-jsx-typescript'
-- use 'maxmellon/vim-jsx-pretty'

-- Svelte
-- use 'evanleck/vim-svelte'
-- Svelte context filetype so commenting works
-- use 'Shougo/context_filetype.vim'


-- ThePrimeagen

-- use 'rhysd/vim-clang-format' -- C++ auto format
-- use 'octol/vim-cpp-enhanced-highlight' -- Syntax highlighting

-- Flutter related stuff
-- use 'dart-lang/dart-vim-plugin'

-- Latex
-- use 'lervag/vimtex'

-- CSV files
-- use 'mechatroner/rainbow_csv'

-- Helm files
-- use 'towolf/vim-helm'

-- Jenkinsfile
-- use 'martinda/Jenkinsfile-vim-syntax'

-- Go
-- use 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
end)


-- Set transparent background
-- autocmd VimEnter * hi Normal ctermbg=none
--
--
--
-- LSP:
-- nvim-lsp-installer
-- Extra plugin for completion called nvim-cmp. 
-- Figure out if I want snippet plugin or not
--
-- Formatting: 
-- Separate plugin if the LSP doesn't support it
-- null-ls <- generic autoformatter interface. Can chain on stuff.
-- 
-- 
-- 
-- Nice big arrows font
-- https://github.com/andreberg/Meslo-Font
--
--
-- Telescope
-- 
-- Learn folding
--
-- Categorise navigation in config
--
-- Gitsigns config and look up Hillary's whack config
-- Git diff tool (configure this in ~/.gitconfig) and git merge tool (mixture of ~/.gitconfig and a plugin called vim-merge-tool)
--
--
