local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require("plugins.config.plenary"),

  -- Theme
  require("plugins.config.theme"),

  -- Editor
  require("plugins.config.neotree"),
  require("plugins.config.nvim-spectre"),
  require("plugins.config.telescope"),
  require("plugins.config.bufferline"),
  require("plugins.config.lualine"),
  require("plugins.config.toggleterm"),
  require("plugins.config.gitsigns"),
  require("plugins.config.neodev"),
  require("plugins.config.vim-illuminate"),

  -- Coding
  require("plugins.config.treesitter"),
  require("plugins.config.luasnip"),
  require("plugins.config.cmp"),
  require("plugins.config.nvim-autopairs"),
  require("plugins.config.nvim-ts-autotag"),
  require("plugins.config.comment"),

  -- UI
  require("plugins.config.dressing"),
  require("plugins.config.indent-blankline"),
  require("plugins.config.mini-indentscope"),

  -- LSP
  require("plugins.config.lsp"),
  require("plugins.config.mason"),
  require("plugins.config.null-ls"),
})
