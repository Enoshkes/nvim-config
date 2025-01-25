return {
  -- TypeScript support
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        tsserver = {},
      },
    },
  },

  -- Treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "typescript",
          "tsx",
          "javascript",
          "html",
          "css",
          "json",
        })
      end
    end,
  },

  -- Mason ensures required tools are installed
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "typescript-language-server")
      table.insert(opts.ensure_installed, "prettier")
      table.insert(opts.ensure_installed, "eslint-lsp")
    end,
  },

  -- Null-ls for formatting
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        local null_ls = require("null-ls")
        vim.list_extend(opts.sources, {
          null_ls.builtins.formatting.prettier.with({
            extra_args = {
              "--single-quote",
              "--jsx-single-quote",
              "--trailing-comma",
              "es5",
              "--semi",
              "false",
            },
          }),
          null_ls.builtins.diagnostics.eslint,
        })
      end
    end,
  },
}
