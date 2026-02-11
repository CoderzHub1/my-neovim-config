-- Diagnostics UI
vim.diagnostic.config({
  virtual_text = true,       -- inline text
  signs = true,              -- gutter icons
  underline = true,          -- underline errors
  update_in_insert = false,  -- don't update while typing
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})



-- Mason
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "gopls",
    "pyright",
    "rust_analyzer",
    "ts_ls",
    "lua_ls",
  },
})

-- Capabilities (for nvim-cmp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- New LSP API (Neovim 0.11+)
vim.lsp.config.pyright = {
  capabilities = capabilities,
}

vim.lsp.config.rust_analyzer = {
  capabilities = capabilities,
}

vim.lsp.config.ts_ls = {
  capabilities = capabilities,
}

vim.lsp.config.lua_ls = {
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

-- Enable servers
vim.lsp.enable({
  "pyright",
  "rust_analyzer",
  "ts_ls",
  "lua_ls",
})



