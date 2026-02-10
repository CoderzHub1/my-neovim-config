-- Path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install if missing
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- Add to runtime
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  -- Theme
  { "folke/tokyonight.nvim" },

  -- Statusline
  { "nvim-lualine/lualine.nvim" },

  -- File tree
  { "nvim-tree/nvim-tree.lua" },

  -- Icons (needed by many plugins)
  { "nvim-tree/nvim-web-devicons" },
  

-- Treesitter
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },

  config = function()
    vim.defer_fn(function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then
        return
      end

      configs.setup({
        ensure_installed = {
          "lua",
          "rust",
          "python",
          "javascript",
          "typescript",
          "json",
          "html",
          "css",
          "bash",
        },

        auto_install = true,

        highlight = { enable = true },
        indent = { enable = true },
      })
    end, 100)
  end,
},


-- LSP + Autocomplete
{
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end,
},

{
  "williamboman/mason-lspconfig.nvim",
},

{
  "neovim/nvim-lspconfig",
},

-- Autocomplete
{
  "hrsh7th/nvim-cmp",
},

{
  "hrsh7th/cmp-nvim-lsp",
},

{
  "L3MON4D3/LuaSnip",
},

{
  "saadparwaiz1/cmp_luasnip",
},

-- Auto pairs
{
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({})
  end,
},



})


