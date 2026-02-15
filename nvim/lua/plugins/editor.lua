return {
  {
    'folke/snacks.nvim',
    opts = {
      picker = {
        hidden = true,
        files = {
          hidden = true,
          ignored = true,
        },
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        }
      },
    }
  },

  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      { "<leader>P", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },

  {
    "3rd/image.nvim",
    build = false,
    opts = {
      processor = "magick_cli",
      integrations = {
        markdown = {
          only_render_image_at_cursor = false,
          only_render_image_at_cursor_mode = "popup",
          -- clear_in_insert_mode = false,
          -- download_remote_images = true,
          -- floating_windows = false,
        },
      },
      tmux_show_only_in_active_window = true,
      -- integrations = {
      --   markdown = {
      --     enabled = true,
      --   },
      --   neorg = {
      --     enabled = true,
      --     clear_in_insert_mode = false,
      --     download_remote_images = true,
      --     only_render_image_at_cursor = false,
      --     floating_windows = false,
      --   },
      -- },
      -- max_width = nil,
      -- max_height = nil,
      -- max_width_window_percentage = nil,
      -- max_height_window_percentage = 50,
      -- scale_factor = 1.0,
      -- window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
      -- window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
      -- editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
      -- hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
    },
  },

  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    ft = "markdown",
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false, -- this will be removed in the next major release
      workspaces = {
        {
          name = "notes",
          path = "~/notes",
        },
      },
    },
  }
}
