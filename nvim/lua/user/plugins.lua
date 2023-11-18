require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'RRethy/nvim-base16'

  -- Language server
  use 'neovim/nvim-lspconfig'

  -- Auto completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'tami5/lspsaga.nvim'

  -- Auto pairing
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'

  -- Syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Language support tools
  use 'akinsho/flutter-tools.nvim'

  -- Debugger
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'

  -- File explorer & fuzzy finder
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-dap.nvim'

  -- Comment
  use 'numToStr/Comment.nvim'

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
