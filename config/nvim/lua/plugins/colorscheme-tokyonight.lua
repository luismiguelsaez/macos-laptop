return {
  "folke/tokyonight.nvim",
  lazy = true,
  name = "tokyonight",
  priority = 1000,
  -- opts = { style = "moon" },
  config = function()
    require("tokyonight").setup({
      style = "moon",
      light_syle = "day",
      transparent = false,
      terminal_colors = true,
    })
  end,
}
