local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local map_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', map_opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua require("lspsaga.diagnostic").navigate("prev")()<CR>', map_opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua require("lspsaga.diagnostic").navigate("next")()<CR>', map_opts)


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>', '<cmd>lua require("lspsaga.rename").rename()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ac', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'x', '<leader>ac', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', map_opts)
end

local servers = { 'tsserver', 'html', 'cssls', 'volar', 'tailwindcss', 'gopls', 'dartls', 'pyright', 'sumneko_lua', 'jsonls', 'yamlls' }

for _, lsp in pairs(servers) do
  local server_opts = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  if (lsp == 'volar') then
    server_opts.init_options = {
      typescript = {
        serverPath = os.getenv("HOME") .. "/.config/yarn/global/node_modules/typescript/lib/tsserverlibrary.js"
      }
    }
  end

  if (lsp == 'sumneko_lua') then
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
