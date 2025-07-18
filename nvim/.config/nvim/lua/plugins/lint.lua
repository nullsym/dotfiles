local CONFIG = os.getenv("XDG_CONFIG_HOME")
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", CONFIG .. "/markdownlint.yaml", "--" },
        },
      },
    },
  },
}
