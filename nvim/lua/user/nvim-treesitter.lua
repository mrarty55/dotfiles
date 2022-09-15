require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'javascript',
    'typescript',
    'html',
    'css',
    'vue',
    'svelte',
    'go',
    'c',
    'cpp',
    'rust',
    'dart',
    'lua',
    'json',
    'yaml',
    'toml',
    'markdown'
  },
  sync_install = true,
  highlight = {
    enable = true
  },
  autotag = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  }
}
