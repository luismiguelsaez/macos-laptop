return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    ensure_installed = {
      "lua_ls",
      "bashls",
      "awk_ls",
      "ansiblels",
      "jsonls",
      "clangd",
      "pyright",
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
    lspconfig.pyright.setup({
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
          },
        },
      },
    })
    lspconfig.pylsp.setup({
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              enabled = false,
            },
          },
        },
      },
    })
  end,
}
