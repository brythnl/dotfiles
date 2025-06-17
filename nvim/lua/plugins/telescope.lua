local actions_default = require('telescope.actions')

local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require('telescope.actions').close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format('%s %s', 'edit', j.path))
      end
    end
  else
    actions_default.select_default(prompt_bufnr)
  end
end

require('telescope').setup({
  defaults = {
    cache_picker = { num_pickers = 5 },
    path_display = { truncate = 1 },
    prompt_prefix = '   ',
    selection_caret = '  ',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<esc>'] = actions_default.close,
        ['<C-Down>'] = actions_default.cycle_history_next,
        ['<C-Up>'] = actions_default.cycle_history_prev,
        ['<C-p>'] = actions_default.move_selection_previous,
        ['<C-n>'] = actions_default.move_selection_next,
        ['<C-q>'] = actions_default.send_selected_to_qflist + actions_default.open_qflist,
        ['<CR>'] = select_one_or_multi,
      },
    },
    file_ignore_patterns = { '.git/' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true,
      mappings = {
        i = {
          ['<C-f>'] = actions_default.to_fuzzy_refine,
        },
      },
    },
    undo = {
      mappings = {
        i = {
          ['<cr>'] = require('telescope-undo.actions').restore,
        },
      },
    },
  },
})

local builtin = require('telescope.builtin')
local lga = require('telescope').load_extension('live_grep_args')
local lgas = require('telescope-live-grep-args.shortcuts')
local undo = require('telescope').load_extension('undo')
require('telescope').load_extension('fzf')

vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<cr>]])
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>h', builtin.oldfiles)
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols)
vim.keymap.set('n', '<leader>S', builtin.lsp_workspace_symbols)
vim.keymap.set('n', '<leader>k', builtin.keymaps)
vim.keymap.set('n', '<leader>r', builtin.resume)
vim.keymap.set('n', '<leader>p', builtin.pickers)
vim.keymap.set('n', '<leader>g', lga.live_grep_args)
vim.keymap.set('n', '<leader>G', lgas.grep_word_under_cursor)
vim.keymap.set('n', '<leader>u', undo.undo)
vim.keymap.set('n', 'gD', builtin.lsp_definitions)
vim.keymap.set('n', 'gT', builtin.lsp_type_definitions)
vim.keymap.set('n', 'gI', builtin.lsp_implementations)
vim.keymap.set('n', 'gR', builtin.lsp_references)
