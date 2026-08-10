-- Keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>e", ":Explore<CR>")
vim.keymap.set("n", "r", "$")
vim.keymap.set("n", "ve", ":Vexplore<CR>")
vim.keymap.set("n", "t", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>s", ":up<CR>")

-- Keymap for showing the error diagnostic
vim.keymap.set("n", "K", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_is_valid(win)
        and vim.api.nvim_win_get_config(win).relative ~= "" then
      vim.api.nvim_win_close(win, true)
      return
    end
  end

  vim.diagnostic.open_float()
end, {
  desc = "Toggle diagnostic",
})
