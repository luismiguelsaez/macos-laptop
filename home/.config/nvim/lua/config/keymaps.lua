-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Globals
local map = vim.keymap.set
local defaults = { noremap = true, silent = true }

-- NeoTree mappings
-- map("n", "<leader>ef", ":Neotree focus<cr>", defaults)
-- map("n", "<leader>et", ":Neotree toggle<cr>", defaults)
-- map("n", "<leader>el", ":Neotree last<cr>", defaults)
-- map("n", "<leader>eF", ":Neotree float<cr>", defaults)
-- map("n", "<leader>eL", ":Neotree left<cr>", defaults)
-- map("n", "<leader>eB", ":Neotree bottom<cr>", defaults)
-- map("n", "<leader>eg", ":Neotree git_status<cr>", defaults)

-- Telescope mappings
map(
  "n",
  "<leader>fG",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { noremap = true, silent = true, desc = "Recursive grep" }
)

-- local telescope_builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<C-x>", telescope_builtin.find_files, {})
-- vim.keymap.set("n", "<C-a>", telescope_builtin.live_grep, {})

local wk = require("which-key")
wk.add({
  mode = { "n" },
  group = "Neotree",
  { "<leader>ef", "<cmd>Neotree focus<cr>", desc = "Focus" },
  { "<leader>et", "<cmd>Neotree toggle<cr>", desc = "Toggle" },
  { "<leader>el", "<cmd>Neotree last<cr>", desc = "Last" },
  { "<leader>eF", "<cmd>Neotree float<cr>", desc = "Float" },
  { "<leader>eL", "<cmd>Neotree left<cr>", desc = "Left" },
  { "<leader>eB", "<cmd>Neotree bottom<cr>", desc = "Botton" },
  { "<leader>eg", "<cmd>Neotree git_status<cr>", desc = "Git status" },
})
