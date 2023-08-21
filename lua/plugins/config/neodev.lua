return {
  "folke/neodev.nvim",
  opts = {},
  config = function(_, opts)
    require("neodev").setup(opts)
  end,
}
