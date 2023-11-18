-- General Config
local map_opts = require('user.settings.mapping')

vim.cmd([[
  colorscheme base16-espresso
  syntax on
  filetype plugin indent on
]])

vim.opt.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.clipboard:append('unnamedplus')
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showmatch = true
vim.opt.wildmode = 'longest,list'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.shortmess:append('c')
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.signcolumn = 'yes'

vim.api.nvim_set_keymap('n', '<space>h', '<cmd>bp <CR>', map_opts)
vim.api.nvim_set_keymap('n', '<space>l', '<cmd>bn <CR>', map_opts)
vim.api.nvim_set_keymap('n', '<space>w', '<cmd>bd <CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>wq', '<cmd>wq <CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>q <CR>', map_opts)
