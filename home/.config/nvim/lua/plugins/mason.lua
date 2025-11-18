return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
  },
  {
    "mason-org/mason-lspconfig.nvim",
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
        "ruff",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      -- Just use default capabilities - blink.cmp handles it automatically
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_init = function(client)
          local venv_path = vim.fn.getcwd() .. "/.venv"
          if vim.fn.isdirectory(venv_path) == 1 then
            client.config.settings.python.pythonPath = venv_path .. "/bin/python"
            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
          end
        end,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              typeCheckingMode = "basic",
            },
          },
        },
      })

      lspconfig.ruff.setup({
        capabilities = capabilities,
        init_options = {
          settings = {
            lineLength = 88,
            lint = {
              enable = true,
              run = "onType",
              select = { "E", "W", "F", "I", "N", "UP", "B", "C4", "SIM" },
              ignore = { "E501" },
            },
            format = { enable = true },
            organizeImports = true,
            fixAll = true,
          },
        },
        on_attach = function(client, bufnr)
          client.server_capabilities.hoverProvider = false
        end,
      })
    end,
  },
}
