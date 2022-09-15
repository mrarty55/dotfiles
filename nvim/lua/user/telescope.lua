local map_opts = require('user.settings.mapping')

require('telescope').load_extension('flutter')

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files <CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep <CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers <CR>', map_opts)
