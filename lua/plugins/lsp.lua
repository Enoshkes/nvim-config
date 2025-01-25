return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/schemastore.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "pylsp", "tsserver", "yamlls" },
      })

      -- Python LSP setup
      require("lspconfig").pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              pyls_mypy = { enabled = true },
              pylsp_black = { enabled = true },
              pyls_isort = { enabled = true },
            },
          },
        },
      })

      -- TypeScript LSP setup
      require("lspconfig").tsserver.setup({
        filetypes = {
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "javascript",
          "javascriptreact",
        },
        root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git"),
        settings = {
          typescript = {
            suggest = {
              includeCompletionsForModuleExports = true,
              includeCompletionsWithObjectLiteralMethodSnippets = true,
              includeCompletionsWithClassMemberSnippets = true,
              completeFunctionCalls = true,
              autoImports = true,
            },
          },
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        yaml = { "prettier" },
      },
    },
  },
}
