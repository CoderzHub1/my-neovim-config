 -- Theme
vim.cmd("colorscheme tokyonight")

-- Lualine
require("lualine").setup({
  options = {
    theme = "tokyonight",
  },
})

-- Nvim Tree
require("nvim-tree").setup()


