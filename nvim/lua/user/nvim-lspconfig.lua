local lspconfig = require('lspconfig')
local lsp_opts = require('user.settings.lsp')
local map_opts = require('user.settings.mapping')

vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', map_opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua require("lspsaga.diagnostic").navigate("prev")()<CR>', map_opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua require("lspsaga.diagnostic").navigate("next")()<CR>', map_opts)

-- List of language servers
local servers = {
  'tsserver',
  'html',
  'cssls',
  'cssmodules_ls',
  'volar',
  'svelte',
  'astro',
  'tailwindcss',
  'clangd',
  'gopls',
  'rust_analyzer',
  'pyright',
  'lua_ls',
  'jsonls',
  'yamlls',
  'dockerls'
}

-- Setup each language servers
for _, lsp in pairs(servers) do
  local server_opts = {
    capabilities = lsp_opts.capabilities,
    on_attach = lsp_opts.on_attach,
  }

  -- Volar for Vue LSP
  if (lsp == 'volar') then
    server_opts.init_options = {
      typescript = {
        serverPath = os.getenv("TS_SERVER_LIB_PATH")
      }
    }
  end

  -- Lua LSP
  if (lsp == 'lua_ls') then
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    server_opts.settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = { 'vim', 'use' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    }
  end

  lspconfig[lsp].setup(server_opts)
end

require('flutter-tools').setup {
  decorations = {
    device = true,
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  widget_guides = {
    enabled = true,
  },
  lsp = {
    color = {
      enabled = true,
      background = true,
    },
    on_attach = lsp_opts.on_attach,
    capabilities = lsp_opts.capabilities,
  }
}
