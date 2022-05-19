require('nvim-tree').setup {
  view = {
    side = 'right',
    number = true,
    relativenumber = true,
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  filters = {
    exclude = {
      ".git",
      "node_modules"
    }
  }
}
