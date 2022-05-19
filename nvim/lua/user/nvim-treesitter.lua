require('nvim-treesitter.configs').setup {
  ensure_installed = { 'javascript', 'typescript', 'html', 'css', 'vue', 'dart', 'go', 'lua', 'json' },
  sync_install = true,
  highlight = {
    enable = true
  }
}
