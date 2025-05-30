local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black", "ruff", "isort" },
    c = { "clang-format" },
    vue = { "prettier" },
    javascript = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
