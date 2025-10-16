return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = { enabled = false },
        ts_ls = {
          enabled = true,
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "/home/bryan/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server",
                languages = { "javascript", "typescript", "vue" },
              },
            },
          },
          settings = {
            typescript = {
              -- inlayHints = {
              --   includeInlayParameterNameHints = "all",
              --   includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              --   includeInlayFunctionParameterTypeHints = true,
              --   includeInlayVariableTypeHints = true,
              --   includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              --   includeInlayPropertyDeclarationTypeHints = true,
              --   includeInlayFunctionLikeReturnTypeHints = true,
              --   includeInlayEnumMemberValueHints = true,
              -- },
            },
          },
        },

        vue_ls = {
          init_options = {
            vue = { hybridMode = true },
          },
          settings = {
            typescript = {
              inlayHints = {
                -- enumMemberValues = { enabled = true },
                -- functionLikeReturnTypes = { enabled = true },
                -- propertyDeclarationTypes = { enabled = true },
                -- parameterTypes = {
                --   enabled = true,
                --   suppressWhenArgumentMatchesName = true,
                -- },
                -- variableTypes = { enabled = true },
              },
            },
          },
        },
      },
    },
  },
}
