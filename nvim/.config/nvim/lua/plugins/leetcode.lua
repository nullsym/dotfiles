return {
  "kawre/leetcode.nvim",
  dependencies = {
    -- "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lang = "python3",
    storage = {
      home = vim.fn.expand("$HOME/d/Leetcode/"),
      cache = vim.fn.stdpath("cache") .. "/leetcode",
    },
  },
}
