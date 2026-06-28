return {
  -- {
  --   "rebelot/kanagawa.nvim",
  --   dependencies = "akinsho/bufferline.nvim",
  -- },
  {
    "EdenEast/nightfox.nvim",
    dependencies = "akinsho/bufferline.nvim",
    opts = {
      options = {
        transparent = true,
      },
      groups = {
        all = {
          StatusLine   = { bg = "NONE", fg = "NONE" },
          StatusLineNC = { bg = "NONE", fg = "NONE" },
          NormalFloat  = { bg = "NONE" },
          FloatBorder  = { bg = "NONE" },
          SignColumn   = { bg = "NONE" },
          EndOfBuffer  = { bg = "NONE" },
          FoldColumn   = { bg = "NONE" },
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },
}
