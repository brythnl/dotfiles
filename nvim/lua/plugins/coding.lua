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

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = {
        enable = true
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      textobjects = {
        lsp_interop = { enable = true },
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['if'] = '@function.inner',
            ['af'] = '@function.outer',
            ['ip'] = '@parameter.inner',
            ['ap'] = '@parameter.outer',
            ['iv'] = '@assignment.inner',
            ['av'] = '@assignment.outer',
            ['ic'] = '@class.inner',
            ['ac'] = '@class.outer',
          },
        }
      }
    }
  },

  -- AI stuff
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    version = "^18.0.0",
    opts = {
      interactions = {
        chat = {
          adapter = {
            name = "gemini",
            model = "gemini-3-flash-preview"
          },
        },
      },
      adapter = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = "GEMINI_API_KEY",
            },
          })
        end,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
    },
    keys = {
      { "<leader>ct", "<cmd>CodeCompanionChat Toggle<cr>" },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          codecompanion = { "codecompanion" },
        }
      },
    },
  },

   {
   "MeanderingProgrammer/render-markdown.nvim",
     ft = { "markdown", "codecompanion" }
   },

   {
     "HakonHarnes/img-clip.nvim",
     opts = {
       filetypes = {
         codecompanion = {
           prompt_for_file_name = false,
           template = "[Image]($FILE_PATH)",
           use_absolute_path = true,
         },
       },
     },
   },

  {
    "marcinjahn/gemini-cli.nvim",
    cmd = "Gemini",
    -- Example key mappings for common actions:
    keys = {
      { "<leader>gt", "<cmd>Gemini toggle<cr>", desc = "Toggle Gemini CLI" },
      { "<leader>ga", "<cmd>Gemini ask<cr>", desc = "Ask Gemini", mode = { "n", "v" } },
      { "<leader>gf", "<cmd>Gemini add_file<cr>", desc = "Add File" },

    },
    dependencies = {
      "folke/snacks.nvim",
    },
    config = true,
  },
}
