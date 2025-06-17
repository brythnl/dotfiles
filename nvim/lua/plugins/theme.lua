-- NIGHTFOX
require('nightfox').setup({
  palettes = {
    terafox = {
      bg1 = "#000000"
    },
  },
})
vim.cmd('colorscheme terafox')

-- ADWAITA
-- vim.g.adwaita_darker = true
-- vim.g.adwaita_disable_cursorline = false
-- vim.cmd('colorscheme adwaita')
-- vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#30323E' })
-- vim.api.nvim_set_hl(0, 'MatchParen', { bg = '#6a6e8a' })

-- ROSE PINE
-- require('rose-pine').setup({
--   variant = 'auto',
--   disable_background = true,
--   disable_italics = true
-- })
-- vim.cmd('colorscheme rose-pine')

-- KANAGAWA
-- require('kanagawa').setup()
-- vim.cmd('colorscheme kanagawa-dragon')

-- MISC
-- vim.api.nvim_set_hl(0, 'FloatBorder', {
--   fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
--   bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
-- })

-- Make the cursor line background invisible
-- vim.api.nvim_set_hl(0, 'CursorLineBg', {
--   fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
--   bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
-- })

-- vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })

-- vim.api.nvim_set_hl(0, 'StatusLineNonText', {
--       fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
--       bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
--     })

-- vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
