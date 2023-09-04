return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  config = function()
    local nls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    nls.setup({
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.gofmt,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
        end
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end,
    })
  end,
}
