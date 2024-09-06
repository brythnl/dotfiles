require('nvim-treesitter.configs').setup({
  indent = {
    enable = true
  },
  ensure_installed = 'all',
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['if'] = '@function.inner',
        ['af'] = '@function.outer',
        ['ia'] = '@parameter.inner',
        ['aa'] = '@parameter.outer',
      },
    }
  }
})
