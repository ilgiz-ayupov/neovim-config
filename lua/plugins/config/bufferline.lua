return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
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
