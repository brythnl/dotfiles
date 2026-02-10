-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    -- vim.opt_local.wrap = true
    vim.opt_local.spell = true

    if vim.bo.filetype == "markdown" then
      local set = vim.keymap.set

      -- Toggle Checkbox
      set("n", "<leader>mx", function()
        local line = vim.api.nvim_get_current_line()
        if line:match("%[ %]") then
          line = line:gsub("%[ %]", "[x]")
        elseif line:match("%[x%]") then
          line = line:gsub("%[x%]", "[ ]")
        else
          line = line:gsub("^%s*([%*%-%+]%s*)", "%1[ ] ")
        end
        vim.api.nvim_set_current_line(line)
      end, { desc = "Toggle Checkbox", buffer = true })

      -- Insert Link
      set("v", "<leader>ml", 'c[<C-r>"]()<Esc>hf(', { desc = "Insert Link", buffer = true })

      -- TODO: install markdown-toc
      -- Table of Contents
      -- set("n", "<leader>mt", "<cmd>GenTocGFM<cr>", { desc = "Generate TOC", buffer = true })
    end
  end,
})
