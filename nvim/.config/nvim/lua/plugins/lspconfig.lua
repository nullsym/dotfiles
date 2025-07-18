return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- https://github.com/microsoft/pyright/discussions/5852#discussioncomment-6874502
      -- Disable hint diagnostics for messages like: "kwargs" is not accessed
      -- which are annoying in Django where we may declare a function
      -- with args and kwargs while not using them
      pyright = {
        capabilities = {
          textDocument = {
            publishDiagnostics = {
              tagSupport = {
                valueSet = { 2 },
              },
            },
          },
        },
      },
      ruff_lsp = {},
    },
  },
}
