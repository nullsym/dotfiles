return {
  "folke/snacks.nvim",
  -- Move snack explorer to the right
  opts = {
    picker = {
      sources = {
        explorer = {
          layout = { layout = { position = "right" } },
        },
      },
    },
  },

  -- Toggle colored vertical line at column 100
  config = function(_, opts)
    require("snacks").setup(opts)
    Snacks.toggle({
      name = "Color Column",
      get = function()
        return vim.o.colorcolumn == "100"
      end,
      set = function(state)
        if state then
          vim.o.colorcolumn = "100"
          vim.cmd([[highlight ColorColumn guibg=#202020]])
        else
          vim.o.colorcolumn = ""
          vim.cmd([[highlight ColorColumn guibg=None]])
        end
      end,
    }):map("<leader>ut", { desc = "Toggle Color Column" })
  end,
}
