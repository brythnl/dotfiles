require('nvim-tree').setup({
  git = {
    ignore = false,
  },
  filters = {
    dotfiles = false,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
  diagnostics = {
    enable = true,
  },
})

vim.keymap.set('n', '<Leader>t', ':NvimTreeFindFileToggle<CR>')
