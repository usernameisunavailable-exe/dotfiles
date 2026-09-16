-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Find and delete LazyVim's built-in trailing whitespace trimmer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  callback = function()
    -- This prevents the trim_whitespace function from executing on HTML files
    vim.b.autoformat = true -- keeps normal formatting alive

    -- Look for the specific LazyVim group if you want to clear it safely
    pcall(function()
      vim.api.nvim_clear_autocmds({ group = "lazyvim_trim_whitespace", buffer = 0 })
    end)
  end,
})
