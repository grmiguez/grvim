require("nvim-tree").setup({
  on_attach = on_attach,
  view = {
    width = 50,
  },
  filters = {
    git_ignored = false,
    dotfiles = false,
  }
})
