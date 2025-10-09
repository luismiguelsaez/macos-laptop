-- ~/.config/nvim/lua/plugins/llm.lua (if using lazy.nvim)
-- or add to your init.lua

return {
  "huggingface/llm.nvim",
  opts = {
    backend = "ollama",
    model = "deepseek-coder:6.7b", -- or deepseek-coder, starcoder2, etc.
    url = "http://localhost:11434/api/generate",

    -- Request parameters
    request_body = {
      options = {
        temperature = 0.2,
        top_p = 0.95,
      },
    },

    -- Completion settings
    tokens_to_clear = { "<|endoftext|>" },
    fim = {
      enabled = true,
      prefix = "<PRE>",
      middle = "<MID>",
      suffix = "<SUF>",
    },

    -- UI settings
    debounce_ms = 150,
    accept_keymap = "<Tab>",
    dismiss_keymap = "<S-Tab>",

    -- Enable/disable
    enable_suggestions_on_startup = true,
    enable_suggestions_on_files = "*", -- or specific filetypes like "*.py"
  },
}
