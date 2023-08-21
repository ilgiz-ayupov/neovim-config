local M = {}

M._keys = nil

function M.get()
  if not M._keys then
    M._keys = {
      {
        "<leader>cd",
        vim.diagnostic.open_float,
        desc = "Открыть диагностику",
      },
      {
        "<leader>cl",
        "<cmd>LspInfo<cr>",
        desc = "Информация об LSP",
      },
      {
        "gd",
        function()
          require("telescope.builtin").lsp_definitions({ reuse_win = true })
        end,
        desc = "Перейти к определению",
        has = "definition",
      },
      {
        "gr",
        "<cmd>Telescope lsp_references<cr>",
        desc = "Ссылки",
      },
      {
        "gD",
        vim.lsp.buf.declaration,
        desc = "Перейти к декларированию",
      },
      {
        "gI",
        function()
          require("telescope.builtin").lsp_implementations({ reuse_win = true })
        end,
        desc = 'перейти к разделу "Реализация"',
      },
      {
        "gy",
        function()
          require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
        end,
        desc = "Перейти к определению типа",
      },
      {
        "K",
        vim.lsp.buf.hover,
        desc = "Наведение",
      },
      {
        "gK",
        vim.lsp.buf.signature_help,
        desc = "Справка о подписи",
        has = "signatureHelp",
      },
      {
        "<c-k>",
        vim.lsp.buf.signature_help,
        mode = "i",
        desc = "Справка о подписи",
        has = "signatureHelp",
      },
      {
        "]d",
        M.diagnostic_goto(true),
        desc = "Следующая диагностика",
      },
      {
        "[d",
        M.diagnostic_goto(false),
        desc = "Предыдущая диагностика",
      },
      {
        "]e",
        M.diagnostic_goto(true, "ERROR"),
        desc = "Следующая ошибка",
      },
      {
        "[e",
        M.diagnostic_goto(false, "ERROR"),
        desc = "Предыдущая ошибка",
      },
      {
        "]w",
        M.diagnostic_goto(true, "WARN"),
        desc = "Следующее предупреждение",
      },
      {
        "[w",
        M.diagnostic_goto(false, "WARN"),
        desc = "Предыдущее предупреждение",
      },
      {
        "<leader>ca",
        vim.lsp.buf.code_action,
        desc = "Действие над кодом",
        mode = {
          "n",
          "v",
        },
        has = "codeAction",
      },
      {
        "<leader>cA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        desc = "Действие над источником",
        has = "codeAction",
      },
      {
        "<c-r>",
        function()
          local inc_rename = require("inc_rename")
          return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Переименовать",
      },
    }
  end
  return M._keys
end

function M.on_attach(_, buffer)
  local Keys = require("utils.keys")
  local keymaps = M.get()

  for _, keys in pairs(keymaps) do
    local opts = Keys.opts(keys)
    opts.has = nil
    opts.silent = opts.silent ~= false
    opts.buffer = buffer
    vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
  end
end

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return M
