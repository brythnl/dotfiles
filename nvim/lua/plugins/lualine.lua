return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local c = {
      blue   = "#7b9fc4",
      cyan   = "#6ecfcd",
      green  = "#72b472",
      yellow = "#ccab53",
      orange = "#cc8a4e",
      red    = "#c47a87",
      violet = "#a388c4",
      fg     = "#a4a1a1",
      dim    = "#5b5754",
      bg     = "NONE",
    }

    local theme = {
      normal   = { a = { fg = c.blue,   bg = c.bg, gui = "bold" }, b = { fg = c.fg,  bg = c.bg }, c = { fg = c.dim, bg = c.bg } },
      insert   = { a = { fg = c.green,  bg = c.bg, gui = "bold" }, b = { fg = c.fg,  bg = c.bg }, c = { fg = c.dim, bg = c.bg } },
      visual   = { a = { fg = c.violet, bg = c.bg, gui = "bold" }, b = { fg = c.fg,  bg = c.bg }, c = { fg = c.dim, bg = c.bg } },
      replace  = { a = { fg = c.red,    bg = c.bg, gui = "bold" }, b = { fg = c.fg,  bg = c.bg }, c = { fg = c.dim, bg = c.bg } },
      command  = { a = { fg = c.orange, bg = c.bg, gui = "bold" }, b = { fg = c.fg,  bg = c.bg }, c = { fg = c.dim, bg = c.bg } },
      terminal = { a = { fg = c.cyan,   bg = c.bg, gui = "bold" }, b = { fg = c.fg,  bg = c.bg }, c = { fg = c.dim, bg = c.bg } },
      inactive = { a = { fg = c.dim,    bg = c.bg               }, b = { fg = c.dim, bg = c.bg }, c = { fg = c.dim, bg = c.bg } },
    }

    return {
      options = {
        theme = theme,
        section_separators = "",
        component_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1 }, "diagnostics" },
        lualine_x = { "diff", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
