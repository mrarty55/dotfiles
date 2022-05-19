vim.api.nvim_set_keymap('n', "<C-h>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-j>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-k>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-l>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", { noremap = true, silent = true })
