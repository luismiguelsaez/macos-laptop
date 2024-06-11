-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Globals
local map = vim.keymap.set
local defaults = { noremap = true, silent = true }

-- NeoTree mappings
map("n", "<leader>ef", ":Neotree focus<cr>", defaults)
map("n", "<leader>et", ":Neotree toggle<cr>", defaults)
map("n", "<leader>el", ":Neotree last<cr>", defaults)
map("n", "<leader>eF", ":Neotree float<cr>", defaults)
map("n", "<leader>eL", ":Neotree left<cr>", defaults)
map("n", "<leader>eB", ":Neotree bottom<cr>", defaults)
map("n", "<leader>eg", ":Neotree git_status<cr>", defaults)

-- Telescope mappings
map(
  "n",
  "<leader>fG",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { noremap = true, silent = true, desc = "Recursive grep" }
)
