-- TODO: Load debug configs from launch.json file

local dap = require('dap')
require('dapui').setup()
local map_opts = require('user.settings.mapping')

vim.api.nvim_set_keymap('n', '<F5>', "<cmd>lua require('dap').continue() <CR>", map_opts)
vim.api.nvim_set_keymap('n', '<F9>', "<cmd>lua require('dap').toggle_breakpoint() <CR>", map_opts)
vim.api.nvim_set_keymap('n', '<F10>', "<cmd>lua require('dap').step_over() <CR>", map_opts)
vim.api.nvim_set_keymap('n', '<F11>', "<cmd>lua require('dap').step_into() <CR>", map_opts)
vim.api.nvim_set_keymap('n', '<F12>', "<cmd>lua require('dap').step_out() <CR>", map_opts)
vim.api.nvim_set_keymap('n', '<leader>dc', "<cmd>lua require('dapui').toggle() <CR>", map_opts)

-- Debug adapter for Go
dap.adapters.go = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/dap/vscode-go/dist/debugAdapter.js' }
}

-- Default debug configuration for Go
dap.configurations.go = {
  {
    type = 'go',
    name = 'Debug Go',
    request = 'launch',
    program = '${file}',
    dlvToolPath = vim.fn.exepath('dlv')
  }
}

-- LLDB adapter
dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
  name = 'lldb'
}

-- Debug configurations for Rust
dap.configurations.rust = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {}
  }
}
