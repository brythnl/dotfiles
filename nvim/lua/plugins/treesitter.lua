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
    lsp_interop = {
      enable = true
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['if'] = '@function.inner',
        ['af'] = '@function.outer',
        ['ip'] = '@parameter.inner',
        ['ap'] = '@parameter.outer',
        ['iv'] = '@assignment.inner',
        ['av'] = '@assignment.outer',
        ['ic'] = '@class.inner',
        ['ac'] = '@class.outer',
      },
    }
  }
})
