return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  priority = 1001,
  config = function()
    require("tokyonight").setup({
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
    })
  end,
}
