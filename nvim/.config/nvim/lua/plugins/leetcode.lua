return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- If you have `nvim-treesitter` installed
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "folke/snacks.nvim", -- For its picker
  },
  opts = {
    picker = { provider = "snacks-picker" },
    lang = "python3",
    storage = {
      home = vim.fn.expand("$HOME/d/Leetcode/"),
      cache = vim.fn.stdpath("cache") .. "/leetcode",
    },
  },
}
