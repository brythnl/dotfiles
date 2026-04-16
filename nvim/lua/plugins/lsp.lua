return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.inlayHints = { enabled = false }

      -- vtsls handles Vue files only (tsgo doesn't support Vue)
      opts.servers.vtsls = vim.tbl_deep_extend("force", opts.servers.vtsls or {}, {
        enabled = true,
        filetypes = { "vue" },
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
                  languages = { "vue" },
                  configNamespace = "typescript",
                  enableForWorkspaceTypeScriptVersions = true,
                },
              },
            },
          },
        },
      })

      opts.servers.vue_ls = opts.servers.vue_ls or {}

      opts.servers.gopls = vim.tbl_deep_extend("force", opts.servers.gopls or {}, {
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
          },
        },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "vue", "css" } },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff",
        "goimports",
        "gofumpt",
        "golangci-lint",
        "gopls",
        "lua-language-server",
        "markdown-toc",
        "markdownlint-cli2",
        "marksman",
        "prisma-language-server",
        "pyright",
        "shfmt",
        "stylua",
        "tailwindcss-language-server",
        "tree-sitter-cli",
        "vtsls",
        "vue-language-server",
      },
    },
  },
}
