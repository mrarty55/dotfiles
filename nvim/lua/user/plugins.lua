require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'shaunsingh/nord.nvim'
  use 'sainnhe/gruvbox-material'

  -- Language server
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'tami5/lspsaga.nvim'

  -- Syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Language support
  use 'pangloss/vim-javascript'
  use 'posva/vim-vue'
  -- use 'ray-x/go.nvim'
  use 'dart-lang/dart-vim-plugin'

  -- File explorer & fuzzy finder
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-telescope/telescope.nvim'

  -- Comment
  use 'tomtom/tcomment_vim'

  -- Status line and buffer tabs
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'

  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- nvim tmux navigator
  use 'alexghergh/nvim-tmux-navigation'

  -- Support other plugins
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
end)
