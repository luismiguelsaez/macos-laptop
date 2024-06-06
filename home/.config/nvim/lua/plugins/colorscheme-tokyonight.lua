return {
  "folke/tokyonight.nvim",
  lazy = false,
  name = "tokyonight",
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "moon",
      light_syle = "day",
      transparent = false,
      terminal_colors = true,
    })
  end,
}
