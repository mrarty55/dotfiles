local lsp_opts = require('user.settings.lsp')

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
