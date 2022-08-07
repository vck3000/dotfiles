-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colour theme
  use 'folke/tokyonight.nvim'
  use 'sainnhe/sonokai'

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() 
      require("nvim-tree").setup()
    end
  }

  -- Fuzzy file finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- LSP
  use 'neovim/nvim-lspconfig' 

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp', -- Main completion engine
    requires = {
      'hrsh7th/cmp-nvim-lsp', -- Connects LSP as a source
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua', -- neovim specific lua completions
      'hrsh7th/cmp-buffer', -- Connects words in buffer as a source
      'hrsh7th/cmp-path', -- Connects path files/directories as a source

      'hrsh7th/cmp-vsnip', -- vsnip snippets
      'hrsh7th/vim-vsnip'
    },
    config = function()
      require'cmp'.setup {
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'nvim_lua' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'vsnip' },
        }
      }
    end
  }

  -- Quality of life
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-sleuth'
  -- use 'tpope/vim-fugitive'
  use 'jiangmiao/auto-pairs'

  -- Shows git additions/deletions in sidebar
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "lua", "rust", "python", "javascript", "typescript", "go" },
        auto_install = true,
      }
    end,
    run = function() 
      require('nvim-treesitter.install').update({ with_sync = true }) 
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup()
    end
    -- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Extra rust stuff like inlay hints
  use {
    'simrat39/rust-tools.nvim',
  }

end)
