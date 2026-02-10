return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
      },
      checkbox = {
        enabled = true,
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰄵 " },
      },
      callout = {
        note = { icon = "󰋽 " },
        tip = { icon = "󰌵 " },
        important = { icon = "󰅒 " },
        warning = { icon = "󰀪 " },
        caution = { icon = "󰳦 " },
      },
    },
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      for i = 1, 6 do
        vim.api.nvim_set_hl(0, "RenderMarkdownH" .. i, { bold = true })
      end
    end,
  },

  {
    "obsidian-nvim/obsidian.nvim",
    opts = {
      ui = { enable = false },
    },
  },

  -- Add Word Count to Lualine (Safe merge)
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      local function wordcount()
        if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" then
          return tostring(vim.fn.wordcount().words) .. " words"
        end
        return ""
      end
      table.insert(opts.sections.lualine_y, { wordcount })
    end,
  },
}
