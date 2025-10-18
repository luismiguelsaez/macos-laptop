return {
  "mason-org/mason.nvim",
  dependencies = { "mason-org/mason.nvim" },
  opts = {
    ensure_installed = {
      "lua_ls",
      "bashls",
      "awk_ls",
      "ansiblels",
      "jsonls",
      "clangd",
      "pyright",
      "pylsp",
      "jsonnet_ls",
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
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
    lspconfig.pyright.setup({
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
          },
        },
      },
    })
    lspconfig.pylsp.setup({
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              enabled = true,
              ignore = "E391",
            },
          },
        },
      },
    })
  end,
}