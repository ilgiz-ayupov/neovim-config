return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Предыдущая вкладка" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Следующая вкладка" },
  },
  opts = {
    options = {
      mode = "buffers",
      offsets = {
        {
          filetype = "neo-tree",
          text = "Файлы",
          separator = true,
          padding = 1,
        },
      },
      diagnostics = "nvim_lsp",
    },
  },
}
