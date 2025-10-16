-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set
local del = vim.keymap.del

del("n", "<leader>bd")
set("n", "<leader>q", function()
  Snacks.bufdelete()
end, { desc = "Delete buffer" })
