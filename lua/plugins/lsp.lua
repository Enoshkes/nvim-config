return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "pylsp" },
      })
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
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
      },
    },
  },
}
