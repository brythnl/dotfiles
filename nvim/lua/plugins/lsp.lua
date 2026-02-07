return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlayHints = { enabled = false },
      servers = {
        vtsls = {
          -- tsgo is not compatible with vue_ls yet
          filetypes = { "vue" },
        },
        tsgo = {},
      -- Using vtsls through extras, ts_ls is disabled
      --   ts_ls = {
      --     enabled = true,
      --     filetypes = { "typescript", "javascript", "vue" },
      --     init_options = {
      --       plugins = {
      --         {
      --           name = "@vue/typescript-plugin",
      --           location = "/home/bryan/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server",
      --           languages = { "vue" },
      --         },
      --       },
      --     },
      --     settings = {
      --       typescript = {
      --         -- inlayHints = {
      --         --   includeInlayParameterNameHints = "all",
      --         --   includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      --         --   includeInlayFunctionParameterTypeHints = true,
      --         --   includeInlayVariableTypeHints = true,
      --         --   includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      --         --   includeInlayPropertyDeclarationTypeHints = true,
      --         --   includeInlayFunctionLikeReturnTypeHints = true,
      --         --   includeInlayEnumMemberValueHints = true,
      --         -- },
      --       },
      --     },
      --   },
      --
      --   vue_ls = {
      --     init_options = {
      --       vue = { hybridMode = true },
      --     },
      --     settings = {
      --       typescript = {
      --         inlayHints = {
      --           -- enumMemberValues = { enabled = true },
      --           -- functionLikeReturnTypes = { enabled = true },
      --           -- propertyDeclarationTypes = { enabled = true },
      --           -- parameterTypes = {
      --           --   enabled = true,
      --           --   suppressWhenArgumentMatchesName = true,
      --           -- },
      --           -- variableTypes = { enabled = true },
      --         },
      --       },
      --     },
      --   },
      -- },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        'ruff',
        'goimports',
        'gofumpt',
        'golangci-lint',
        'gopls',
        'lua-language-server',
        'markdown-toc',
        'markdownlint-cli2',
        'marksman',
        'prisma-language-server',
        'pyright',
        'shfmt',
        'stylua',
        'tailwindcss-language-server',
        'tree-sitter-cli',
        'vtsls',
        'vue-language-server',
      },
    },
  },
}
