 -- Theme
vim.cmd("colorscheme github_dark_default")

-- Lualine
require("lualine").setup({
  options = {
    theme = "tokyonight",
  },
})

-- Nvim Tree
require("nvim-tree").setup()


