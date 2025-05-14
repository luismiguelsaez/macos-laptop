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
      "ruff",
    },
  },
  config = function()
    local lspconfig = require("lspconfig")
    -- https://github.com/astral-sh/ruff-lsp?tab=readme-ov-file#settings
    lspconfig.ruff.setup({
      init_options = {
        settings = {
          -- Modification to any of these settings has no effect.
          enable = true,
          ignoreStandardLibrary = true,
          organizeImports = true,
          fixAll = true,
          lint = {
            enable = true,
            run = "onType",
          },
        },
      },
    })
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
    -- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
    lspconfig.pylsp.setup({
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              enabled = false,
              ignore = "E391",
            },
          },
        },
      },
    })
  end,
}
