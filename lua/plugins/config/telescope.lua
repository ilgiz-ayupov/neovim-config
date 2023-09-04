return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Поиск файлов" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Поиск (root dir)" },
    { "<leader>gb", "<cmd>Telescope git_brances<cr>", desc = "Git ветки" },
  },
}
