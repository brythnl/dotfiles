-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local util = require("lspconfig/util")

-- Vue
require('lspconfig').volar.setup({
  capabilities = capabilities,
  -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
  -- This drastically improves the responsiveness of diagnostic updates on change
  -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

-- JavaScript, TypeScript
require('lspconfig').tsserver.setup({ capabilities = capabilities })

-- Python
require('lspconfig').pyright.setup({ capabilities = capabilities })

-- Go
require('lspconfig').gopls.setup({
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
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
vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>") -- got to declaration
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>") -- see definition and make edits in window
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>") -- go to implementation
-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
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
