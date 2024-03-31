local separator = { '"|"', color = 'StatusLineNonText' }

require('lualine').setup({
  options = {
    section_separators = '',
    component_separators = '',
    globalstatus = true,
    theme = 'rose-pine',
    -- theme = {
      -- normal = {
      --   a = 'StatusLine',
      --   b = 'StatusLine',
      --   c = 'StatusLine',
      -- },
    -- },
  },
  sections = {
    lualine_a = {
      'mode',
      { '"►"', color = 'StatusLineNonText' },
    },
    lualine_b = {
      'branch',
      'diff',
      separator,
      '"🖧  " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
      { 'diagnostics', sources = { 'nvim_diagnostic' } },
      separator,
      '"{…}" .. tostring(vim.api.nvim_call_function("codeium#GetStatusString", {}))',
      separator,
    },
    lualine_c = {
      'filename'
    },
    lualine_x = {
      'filetype',
      'encoding',
      'fileformat',
    },
    lualine_y = {
      separator,
      '(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
      separator,
    },
    lualine_z = {
      'location',
      'progress',
    },
  },
})
