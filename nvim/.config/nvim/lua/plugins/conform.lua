return {
  "conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "ruff_format" },
    },
    formatters = {
      ruff_format = {
        append_args = { "--config", "line-length = 100" },
      },
    },
  },
}
