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
  -- Your lspconfig setup in a separate block
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if has_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities()
      end

      -- Your server setups here
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      })

      lspconfig.ruff.setup({
        capabilities = capabilities,
      })

      -- ... rest of your servers
    end,
  },
}
