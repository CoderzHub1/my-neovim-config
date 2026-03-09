 -- Theme
vim.cmd("colorscheme vim")

-- Lualine
require("lualine").setup({
  options = {
    theme = "tokyonight",
  },
})

-- Nvim Tree
require("nvim-tree").setup()


