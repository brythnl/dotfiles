-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local util = require("lspconfig/util")

-- Volar Hybrid Mode for TS and Vue setup: https://github.com/vuejs/language-tools/pull/4134/files
-- Using https://github.com/pmizio/typescript-tools.nvim instead of tsserver
require('lspconfig').tsserver.setup({
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '/home/bryan/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server',
        languages = { 'vue' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

require('lspconfig').volar.setup({})

-- Python
require('lspconfig').pyright.setup({ capabilities = capabilities })

-- Go
require('lspconfig').gopls.setup({
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

-- Prisma ORM
require('lspconfig').prismals.setup({ capabilities = capabilities })

-- Tailwind CSS
require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

-- JSON
require('lspconfig').jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

require('lspconfig').lua_ls.setup({ capabilities = capabilities })

-- null-ls
require('null-ls').setup({
  sources = {
    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    require('null-ls').builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.formatting.prettierd,
  },
})

-- Has to be after calling null-ls
require('mason-null-ls').setup({ automatic_installation = true })

-- Keymaps
vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>") -- show definition, references
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- Show all code actions
-- vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.definition()<CR>") -- got to definition
vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>") -- go to definition
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>") -- see definition and make edits in window
vim.keymap.set("n", "gi", "<cmd>Lspsaga finder imp<CR>") -- go to implementation
-- Peek type definition
-- You can edit the file containing the type definition in the floating window
vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>") -- Rename all occurrences of the hovered word for the entire file
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>') -- show floating diagnostics
vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>") -- show diagnostics for cursor
vim.keymap.set("n", "<leader>bd", "<cmd>Lspsaga show_buf_diagnostics<CR>") -- show diagnostics for buffer
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')

-- Commands
vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format {async = true} end, {})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  }
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
