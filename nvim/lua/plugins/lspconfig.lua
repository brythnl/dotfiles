-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local util = require("lspconfig/util")
local lspconfig = require('lspconfig')

-- TS, JS, Vue
lspconfig.ts_ls.setup({
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '/home/bryan/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server',
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})
lspconfig.volar.setup({})

-- Python
lspconfig.pyright.setup({ capabilities = capabilities })

-- Go
lspconfig.gopls.setup({
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
lspconfig.prismals.setup({ capabilities = capabilities })

-- Tailwind CSS
lspconfig.tailwindcss.setup({ capabilities = capabilities })

-- JSON
lspconfig.jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

-- Lua
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      }
    }
  }
})

-- Markdown
lspconfig.marksman.setup({ capabilities = capabilities })

-- null-ls
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    null_ls.builtins.formatting.golines,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

-- Has to be after calling null-ls
require('mason-null-ls').setup({ automatic_installation = true })

-- Keymaps
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>")
-- vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>")
-- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
-- vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.typeDefinition<CR>")
vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>") -- show diagnostics for line
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>") -- show diagnostics for cursor
vim.keymap.set("n", "<leader>bd", "<cmd>Lspsaga show_buf_diagnostics<CR>") -- show diagnostics for buffer
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set("n", "R", "<cmd>Lspsaga rename<CR>") -- Rename all occurrences of the hovered word for the entire file

-- vim.keymap.set("n", "gf", "<cmd>FzfLua lsp_finder<CR>")
-- vim.keymap.set("n", "gD", "<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<CR>")
-- vim.keymap.set("n", "gt", "<cmd>FzfLua lsp_typedefs jump_to_single_result=true ignore_current_line=true<CR>")
-- vim.keymap.set({"n","v"}, "ga", "<cmd>FzfLua lsp_code_actions<CR>")
-- vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<CR>")
-- vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<CR>")
-- vim.keymap.set("n", "<leader>s", "<cmd>FzfLua lsp_document_symbols jump_to_single_result=true ignore_current_line=true<CR>")
-- vim.keymap.set("n", "<leader>d", "<cmd>FzfLua lsp_document_diagnostics jump_to_single_result=true ignore_current_line=true<CR>")
-- vim.keymap.set("n", "<leader>dw", "<cmd>FzfLua lsp_workspace_diagnostics jump_to_single_result=true ignore_current_line=true<CR>")

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
