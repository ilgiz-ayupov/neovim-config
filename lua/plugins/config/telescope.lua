return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Поиск (root dir)" },
  },
}
