return {
  "folke/snacks.nvim",
  lazy = false,
  config = function()
    local Snacks = require("snacks")
    -- Have to run setup explicitly because calling config overwrote
    -- the default setup and thus we ended with no notifier, dashboard, etc.
    Snacks.setup({
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      toggle = { map = LazyVim.safe_keymap_set },
      words = { enabled = true },
      dashboard = { enabled = true },
      -- Move snack explorer to the right
      picker = {
        sources = {
          explorer = {
            layout = { layout = { position = "right" } },
          },
        },
      },
    })
    -- Toggle colored vertical line at column 100
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
