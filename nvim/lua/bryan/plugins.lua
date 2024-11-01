local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
  --- Theme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    dependencies = 'akinsho/bufferline.nvim',
    config = function()
      require('rose-pine').setup({
        variant = 'auto',
        disable_background = true,
        disable_italics = true
      })

      vim.cmd('colorscheme rose-pine')

      vim.api.nvim_set_hl(0, 'FloatBorder', {
        fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
        bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
      })

      -- Make the cursor line background invisible
      vim.api.nvim_set_hl(0, 'CursorLineBg', {
        fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
        bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
      })

      vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })

      vim.api.nvim_set_hl(0, 'StatusLineNonText', {
            fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
            bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
          })

          vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
    end,
  },

  -- Commenting Support
  'tpope/vim-commentary',

  -- Add, change, and delete surrounding text.
  'tpope/vim-surround',

  -- Allow plugins to enable repeating of commands.
  'tpope/vim-repeat',

  -- Navigate seamlessly between Vim windows and Tmux panes.
  'christoomey/vim-tmux-navigator',

  -- Jump to the last location when opening a file.
  'farmergreg/vim-lastplace',

  -- Enable * searching with visually selected text.
  'nelstrom/vim-visual-star-search',

  -- Automatically create parent dirs when saving.
  'jessarcher/vim-heritage',

  -- Text objects for HTML attributes.
  {
    'whatyouhide/vim-textobj-xmlattr',
    dependencies = 'kana/vim-textobj-user',
  },

  -- Automatically set the working directory to the project root.
  {
    'airblade/vim-rooter',
    init = function()
      -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
      vim.g.rooter_manual_only = 1
    end,
    config = function()
      vim.cmd('Rooter')
    end,
  },

  -- Automatically add closing brackets, quotes, etc.
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  },

  -- Automatically close html tags
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  -- Add smooth scrolling to avoid jarring jumps
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
  },

  -- All closing buffers without closing the split window.
  {
    'famiu/bufdelete.nvim',
    config = function()
      vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
    end,
  },

  -- Split arrays and methods onto multiple lines, or join them back up.
  {
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
      vim.g.splitjoin_trailing_comma = 1
      vim.g.splitjoin_php_method_chain_full = 1
      vim.keymap.set('n', 'gl', ':SplitjoinSplit<CR>')
      vim.keymap.set('n', 'gL', ':SplitjoinJoin<CR>')
    end,
  },

  -- Automatically fix indentation when pasting code.
  {
    'sickill/vim-pasta',
    config = function()
      vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-live-grep-args.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('bryan/plugins/telescope')
    end,
  },

  -- File tree sidebar
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bryan/plugins/nvim-tree')
    end,
  },

  -- A Status line.
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bryan/plugins/lualine')
    end,
  },

  -- Display buffers as tabs.
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bryan/plugins/bufferline')
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('bryan/plugins/indent-blankline')
    end,
  },

  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('bryan/plugins/dashboard-nvim')
    end,
    dependencies = {'nvim-tree/nvim-web-devicons'}
  },

  -- Git integration.
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
      vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
      vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
      vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
      vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
      vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
    end,
  },

  -- Git commands.
  {
    'tpope/vim-fugitive',
    dependencies = 'tpope/vim-rhubarb',
  },

  -- Emmet
  {
    "mattn/emmet-vim",
    init = function () -- load stuff before the plugin is loaded
      require('bryan/plugins/emmet')
    end,
  },

  -- Improved syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('bryan/plugins/treesitter')
    end,
  },

  -- Language Server Protocol.
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'b0o/schemastore.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'jayp0521/mason-null-ls.nvim',
    },
    config = function()
      require('bryan/plugins/lspconfig')
    end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    ft = 'go',
    opts = function()
      return require("bryan.plugins.null-ls")
    end,
  },

  {
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
          require("lspsaga").setup({
              move_in_saga = { prev = "<C-k>", next = "<C-j>" },
              finder_action_keys = {
                open = "<CR>",
                },
                definition_action_keys = {
                    edit = "<CR>",
                },
          })
      end,
      dependencies = {
          {"nvim-tree/nvim-web-devicons"},
          --Please make sure you install markdown and markdown_inline parser
          {"nvim-treesitter/nvim-treesitter"}
      },
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim',
    },
    config = function()
      require('bryan/plugins/cmp')
    end,
  },

  -- TypeScript, Vue
  -- {
  --   'pmizio/typescript-tools.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'neovim/nvim-lspconfig'
  --   },
  --   opts = {},
  --   config = function()
  --     require("typescript-tools").setup({
  --       init_options = {
  --         plugins = {
  --           {
  --             name = '@vue/typescript-plugin',
  --             location = '/home/bryan/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server',
  --             languages = { 'vue' },
  --           },
  --         },
  --       },
  --     })

  --     require('lspconfig').volar.setup({
  --       capabilities = capabilities,
  --       init_options = {
  --         vue = {
  --           hybridMode = false,
  --         },
  --       }
  --     })
  --   end,
  -- },

  -- Rust
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  },

  -- TODO: Setup debugger
  -- Debugger
  -- 'mfussenegger/nvim-dap',

  -- {
  --   "microsoft/vscode-js-debug",
  --   lazy = true,
  --   build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  -- },

  -- {
  --   "mxsdev/nvim-dap-vscode-js",
  --   dependencies = {"mfussenegger/nvim-dap"},
  --   config = function()
  --     require('bryan/plugins/nvim-dap')
  --   end,
  -- },

  -- TODO: install nvim-nio for this
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = {"mfussenegger/nvim-dap"},
  --   config = function()
  --     require('dapui').setup()
  --     vim.keymap.set('n', '<leader>ui', require('dapui').toggle)
  --   end,
  -- },

  -- 'theHamsta/nvim-dap-virtual-text',

  -- {
  --   "kdheepak/lazygit.nvim",
  --   cmd = {
  --     "LazyGit",
  --     "LazyGitConfig",
  --     "LazyGitCurrentFile",
  --     "LazyGitFilter",
  --     "LazyGitFilterCurrentFile",
  --   },
  --   -- optional for floating window border decoration
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  -- },

  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.keymap.set('i', '<C-c>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end,
  },

  {
      "toppair/peek.nvim",
      event = { "VeryLazy" },
      build = "deno task --quiet build:fast",
      config = function()
          require("peek").setup()
          vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
          vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
      end,
  },
})
