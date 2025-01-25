-- bootstrap lazy.nvim, LazyVim and your plugins

vim.filetype.add({
  extension = {
    yaml = "helm",
    tpl = "helm",
  },
  pattern = {
    [".*/templates/.*%.yaml"] = "helm",
    [".*/templates/.*%.tpl"] = "helm",
    ["values.*%.yaml"] = "helm",
    ["Chart%.yaml"] = "helm",
  },
})

require("config.lazy")
