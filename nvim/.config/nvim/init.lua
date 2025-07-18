-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.man")
vim.cmd.colorscheme("tokyonight-night")
-- Highlight column
vim.opt.colorcolumn = "100"
vim.cmd([[highlight ColorColumn guibg=#202020]])
