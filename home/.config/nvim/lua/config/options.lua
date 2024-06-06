-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Globals
local map = vim.keymap.set
local defaults = { noremap = true, silent = true }

-- NeoTree mappings
map("n", "<leader>et", ":Neotree focus<cr>", defaults)
map("n", "<leader>ef", ":Neotree float<cr>", defaults)
map("n", "<leader>el", ":Neotree left<cr>", defaults)
map("n", "<leader>eb", ":Neotree bottom<cr>", defaults)
map("n", "<leader>eg", ":Neotree git_status<cr>", defaults)