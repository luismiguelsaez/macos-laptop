return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    ensure_installed = {
      "lua_ls",
      "pylsp",
      "bashls",
      "awk_ls",
      "ansiblels",
      "jsonls",
      "pyright",
      "clangd",
    },
  },
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.gopls.setup({
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })
    lspconfig.pyright.setup({})
  end,
}
