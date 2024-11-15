vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('n', 'J', ':bp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'K', ':bn<CR>', { silent = true })
