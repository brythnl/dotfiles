return {
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
