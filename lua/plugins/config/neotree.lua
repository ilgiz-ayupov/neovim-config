return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", ":Neotree left reveal<CR>", desc = "Файловая система" },
    { "<leader>o", ":Neotree float git_status<CR>", desc = "История Git" },
  },
  opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    default_component_configs = {
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "󰁕",
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          "node_modules",
        },
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
  end,
}
