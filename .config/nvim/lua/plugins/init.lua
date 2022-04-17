local fn = vim.fn

-- Automatically install packer if it doesn't exist yet
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
  use('wbthomason/packer.nvim') -- Let packer manage itself

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
      require('plugins.nvim-tree')
    end
  }

  -- Treesitter helps with syntax highlighting
  -- Also helps neovim identify which sections of code are "foldable" for smart folding.
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.nvim-treesitter')
    end
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

-- Javascript syntax highlighting
-- use 'pangloss/vim-javascript'
-- use 'leafgarland/typescript-vim'
-- use 'peitalin/vim-jsx-typescript'
-- use 'maxmellon/vim-jsx-pretty'

-- Svelte
-- use 'evanleck/vim-svelte'
-- Svelte context filetype so commenting works
-- use 'Shougo/context_filetype.vim'


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
