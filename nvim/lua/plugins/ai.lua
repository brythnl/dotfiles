return {
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },
    },
  },

  {
    "marcinjahn/gemini-cli.nvim",
    cmd = "Gemini",
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
