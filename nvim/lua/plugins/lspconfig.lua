-- Setup Mason to automatically install LSP servers
require('mason').setup()
-- NOTE: Installed servers are automatically enabled (vim.lsp.enable()) by default
require('mason-lspconfig').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local util = require('lspconfig/util')

-- TS, JS, Vue
vim.lsp.config('ts_ls', {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '/home/bryan/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server',
        languages = {'javascript', 'typescript', 'vue'},
      },
    },
  },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})
vim.lsp.config('vue_ls', {
  init_options = {
    vue = {
      hybridMode = true,
    },
  },
  settings = {
    typescript = {
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        parameterTypes = {
          enabled = true,
          suppressWhenArgumentMatchesName = true,
        },
        variableTypes = { enabled = true },
      },
    },
  },
})

-- Go
vim.lsp.config('gopls', {
  capabilities = capabilities,
  cmd = {'gopls'},
  filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
  root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
  settings = {
    gopls = {
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

-- PostgreSQL
vim.lsp.config('postgrestools', {
  capabilities = capabilities,
  cmd = {'postgrestools', 'lsp-proxy'},
  filetypes = {'sql'},
})

-- Prisma ORM
vim.lsp.config('prismals', { capabilities = capabilities })
-- Markdown
vim.lsp.config('marksman', { capabilities = capabilities })
-- YAML
vim.lsp.config('yamlls', { capabilities = capabilities })
-- Tailwind CSS
vim.lsp.config('tailwindcss', { capabilities = capabilities })
-- JSON
vim.lsp.config('jsonls', { capabilities = capabilities })
-- Python
vim.lsp.config('pyright', { capabilities = capabilities })
-- Lua
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      }
    }
  }
})


-- null-ls
-- A meta LSP client that integrates external diagnostics, formatting and code actions as if they were LSP servers
-- Therefore needs to be explicitly enabled
local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
vim.lsp.config('null-ls', {
  sources = {
    null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    null_ls.builtins.formatting.golines,
  },
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
vim.lsp.enable('null-ls')

-- Has to be after calling null-ls
require('mason-null-ls').setup({ automatic_installation = true })

-- Keymaps
vim.keymap.set({'n','v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>')
vim.keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>')
-- vim.keymap.set('n', 'gD', '<cmd>Lspsaga goto_definition<CR>')
-- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>')
vim.keymap.set('n', 'gt', '<cmd>Lspsaga peek_type_definition<CR>')
-- vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.typeDefinition<CR>')
vim.keymap.set('n', '<leader>ld', '<cmd>Lspsaga show_line_diagnostics<CR>') -- show diagnostics for line
vim.keymap.set('n', '<leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>') -- show diagnostics for cursor
vim.keymap.set('n', '<leader>bd', '<cmd>Lspsaga show_buf_diagnostics<CR>') -- show diagnostics for buffer
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'R', '<cmd>lua vim.lsp.buf.rename()<CR>') -- Rename all occurrences of the hovered word for the entire file
vim.keymap.set('n', 'I', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

-- FzfLua commands
-- vim.keymap.set('n', 'gf', '<cmd>FzfLua lsp_finder<CR>')
-- vim.keymap.set('n', 'gD', '<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<CR>')
-- vim.keymap.set('n', 'gt', '<cmd>FzfLua lsp_typedefs jump_to_single_result=true ignore_current_line=true<CR>')
-- vim.keymap.set({'n','v'}, 'ga', '<cmd>FzfLua lsp_code_actions<CR>')
-- vim.keymap.set('n', 'gi', '<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<CR>')
-- vim.keymap.set('n', 'gr', '<cmd>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<CR>')
-- vim.keymap.set('n', '<leader>s', '<cmd>FzfLua lsp_document_symbols jump_to_single_result=true ignore_current_line=true<CR>')
-- vim.keymap.set('n', '<leader>d', '<cmd>FzfLua lsp_document_diagnostics jump_to_single_result=true ignore_current_line=true<CR>')
-- vim.keymap.set('n', '<leader>dw', '<cmd>FzfLua lsp_workspace_diagnostics jump_to_single_result=true ignore_current_line=true<CR>')

-- Commands
vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format {async = true} end, {})

-- Diagnostic configuration
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
  virtual_text = false,
  float = {
    source = true,
  }
})
