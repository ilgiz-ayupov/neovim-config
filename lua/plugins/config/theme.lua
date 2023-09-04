return {
  "sainnhe/sonokai",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme sonokai")
  end,
}

-- Gruvbox
-- return {
--   "ellisonleao/gruvbox.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.o.background = "dark" -- or "light" for light mode
--     vim.cmd([[colorscheme gruvbox]])
--   end,
-- }
