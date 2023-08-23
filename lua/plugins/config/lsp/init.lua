return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
        { "williamboman/mason.nvim" },
      },
    },
    { "hrsh7th/cmp-nvim-lsp" },
    {
      "smjonas/inc-rename.nvim",
      opts = {},
    },
  },
  keys = {},
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = false,
      severity_sort = true,
    },
    servers = {
      -- html
      emmet_language_server = {},
      html = {},

      -- css / scss / less
      cssls = {},

      -- typescript, javascript
      tsserver = {},

      -- eslint
      eslint = {
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      },

      -- php
      intelephense = {},

      -- lua
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "jit" },
            },
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },

      -- json
      jsonls = {},
    },
  },
  config = function(_, opts)
    -- diagnostics
    for name, icon in pairs(require("icons").lsp.diagnostics) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    -- keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = require("plugins.config.lsp.keymaps").on_attach,
    })

    -- servers
    local servers = opts.servers
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      has_cmp and cmp_nvim_lsp.default_capabilities() or {},
      opts.capabilities or {}
    )

    local function setup(server)
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, servers[server] or {})

      require("lspconfig")[server].setup(server_opts)
    end

    -- get all the servers that are available thourgh mason-lspconfig
    local have_mason, mlsp = pcall(require, "mason-lspconfig")
    local all_mslp_servers = {}
    if have_mason then
      all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
    end

    local ensure_installed = {} ---@type string[]
    for server, server_opts in pairs(servers) do
      if server_opts then
        server_opts = server_opts == true and {} or server_opts
        -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
        if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
          setup(server)
        else
          ensure_installed[#ensure_installed + 1] = server
        end
      end
    end

    if have_mason then
      mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
    end
  end,
}
