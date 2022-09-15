local map_opts = require "user.settings.mapping"

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>',
    map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>', '<cmd>lua require("lspsaga.rename").rename()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ac', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>',
    map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'x', '<leader>ac', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>'
    , map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>',
    map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>',
    map_opts)
end

local lsp_options = {
  capabilities = capabilities,
  on_attach = on_attach,
}

return lsp_options
