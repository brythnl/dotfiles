-- local lighter_blue = '#1f1c2f'
-- local darker_blue = '#191624'
-- local white = '#ffffff'

require('bufferline').setup({
  options = {
    indicator = {
      icon = ' ',
    },
    show_close_icon = false,
    tab_size = 0,
    max_name_length = 25,
    offsets = {
      {
        filetype = 'NvimTree',
        text = '  Files',
        text_align = 'left',
      },
    },
    separator_style = 'slant',
    modified_icon = '',
    custom_areas = {
      left = function()
        return {
          { text = '    ', fg = '#8fff6d' },
        }
      end,
    },
  },
  -- highlights = {
  --   fill = {
  --     bg = darker_blue,
  --     fg = lighter_blue,
  --   },
  --   background = {
  --     bg = darker_blue,
  --   },
  --   tab = {
  --     bg = lighter_blue,
  --   },
  --   tab_close = {
  --     bg = lighter_blue,
  --   },
  --   close_button = {
  --     bg = lighter_blue,
  --     fg = white,
  --   },
  --   close_button_visible = {
  --     bg = lighter_blue,
  --     fg = white,
  --   },
  --   close_button_selected = {
  --     bg = lighter_blue,
  --     fg = white,
  --   },
  --   buffer_visible = {
  --     bg = lighter_blue,
  --   },
  --   buffer_selected = {
  --     bg = lighter_blue,
  --   },
  --   modified = {
  --     bg = lighter_blue,
  --   },
  --   modified_visible = {
  --     bg = lighter_blue,
  --   },
  --   modified_selected = {
  --     bg = lighter_blue,
  --   },
  --   duplicate = {
  --     bg = lighter_blue,
  --   },
  --   duplicate_visible = {
  --     bg = lighter_blue,
  --   },
  --   separator = {
  --     bg = lighter_blue,
  --     fg = darker_blue,
  --   },
  --   separator_selected = {
  --     bg = lighter_blue,
  --     fg = darker_blue,
  --   },
  --   separator_visible = {
  --     bg = lighter_blue,
  --     fg = darker_blue,
  --   },
  -- },
})
