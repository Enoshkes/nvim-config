return {
  {
    "towolf/vim-helm",
    lazy = false,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")
      -- Load snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Get all kubernetes snippets
      local k8s_snippets = luasnip.get_snippets("kubernetes")

      -- Add them for both yaml and helm filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "yaml", "helm", "yaml.helm" }, -- Added all possible filetypes
        callback = function()
          -- Add kubernetes snippets to the current buffer
          if k8s_snippets then
            -- Add to both filetypes to ensure they're available
            luasnip.add_snippets("helm", k8s_snippets)
            luasnip.add_snippets("yaml", k8s_snippets)
            luasnip.add_snippets("yaml.helm", k8s_snippets)
          end
        end,
      })
    end,
  },
}
