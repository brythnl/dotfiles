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

  { "nvim-treesitter/nvim-treesitter-textobjects", enabled = false },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          prepend_args = { "--config", os.getenv("HOME") .. "/.config/nvim/configs/.markdownlint-cli2.yaml", "--" },
        },
        ["golangci-lint"] = {
          prepend_args = { "--config", os.getenv("HOME") .. "/.config/nvim/configs/.golangci.yaml" },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ["markdownlint-cli2"] = {
          prepend_args = { "--config", os.getenv("HOME") .. "/.config/nvim/configs/.markdownlint-cli2.yaml" },
        },
      },
    },
  },

  {
    "mikavilpas/blink-ripgrep.nvim",
    dependencies = { "saghen/blink.cmp" },
  },
  {
    "Kaiser-Yang/blink-cmp-git",
    dependencies = { "saghen/blink.cmp" },
  },
  {
    "Kaiser-Yang/blink-cmp-dictionary",
    dependencies = { "saghen/blink.cmp" },
  },
  {
    "Kaiser-Yang/blink-cmp-avante",
    dependencies = { "saghen/blink.cmp" },
  },

  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "ripgrep" },
        providers = {
          ripgrep = { module = "blink-ripgrep", name = "Ripgrep" },
          git = { module = "blink-cmp-git", name = "Git" },
          dictionary = { module = "blink-cmp-dictionary", name = "Dict" },
          avante = { module = "blink-cmp-avante", name = "Avante" },
        },
        per_filetype = {
          gitcommit = { "lsp", "path", "snippets", "buffer", "git" },
          markdown = { "lsp", "path", "snippets", "buffer", "ripgrep", "dictionary" },
          AvanteInput = { "avante", "lsp", "path", "snippets", "buffer" },
        },
      },
    },
  },
}

