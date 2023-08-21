return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  keys = {
    {
      "<leader>R",
      function()
        require("spectre").open()
      end,
      desc = "Замена в файлах (Spectre)",
    },
  },
}
