-- Disable using spaces for tabs (Go uses tabs for indentation)
-- Somehow disabling this also allows multiline strings to go to first column
vim.opt.expandtab = false
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
