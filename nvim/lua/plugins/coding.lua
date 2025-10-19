return {
  -- Split arrays and methods onto multiple lines, or join them back up.
  {
    "AndrewRadev/splitjoin.vim",
    config = function()
      vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
      vim.g.splitjoin_trailing_comma = 1
      vim.keymap.set("n", "gl", ":SplitjoinSplit<CR>")
      vim.keymap.set("n", "gL", ":SplitjoinJoin<CR>")
    end,
  },

  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip").filetype_extend("javascriptreact", { "html" })
      require("luasnip").filetype_extend("typescriptreact", { "html" })
      require("luasnip").filetype_extend("vue", { "html" })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
