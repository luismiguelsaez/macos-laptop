return {
  "numToStr/FTerm.vim",
  name = "FTerm",
  enabled = true,
  event = "VeryLazy",
  version = "master",
  config = function()
    require("FTerm").setup({
      border = "double",
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    })
  end,
}
