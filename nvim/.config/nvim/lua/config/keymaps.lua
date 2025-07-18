-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<PageUp>", "<C-u>zz")
vim.keymap.set("n", "<PageDown>", "<C-d>zz")
vim.keymap.set("n", "\\x", "<cmd>!chmod +x %<CR>", { desc = "Make Executable", silent = true })
vim.keymap.set("n", "\\s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute Word" })

-- Yank/Paste to system clipboard (default in lazyvim)
-- vim.keymap.set("n", "\\Y", [["+Y]], { desc = "Yank" })
-- vim.keymap.set("n", "\\p", [["+p]], { desc = "Paste" })
-- (visual mode) Preserves yank history when pasting
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste (Non-destructive)" })

-- Press '\\' to switch between buffers
vim.keymap.set("n", "\\\\", "<C-^>", { desc = "Switch buffers" })
-- Run a new tmux window with the 'tmux-sessionizer' command
vim.keymap.set("n", "\\t", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "tmux-sessionizer" })

-- Deletes
vim.keymap.del("n", "<leader>e") -- Explorer Snack
vim.keymap.del("n", "<leader>E") -- Explorer Snack
vim.keymap.del("n", "<leader>fE") -- Explorer Snack

-- Weird Tmux keyboard issue
-- <Home> is interpreted as <Find>
-- <End> is interpreted as <Select>
vim.keymap.set("i", "<Find>", "<Esc><C-0>i")
vim.keymap.set("i", "<Select>", "<Esc><C-$>a")
vim.keymap.set("n", "<Find>", "<C-0>")
vim.keymap.set("n", "<Select>", "<C-$>")

-- Navigate buffers
-- stylua: ignore start
vim.keymap.set("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true})
vim.keymap.set("i", "<A-1>", "<Esc>:BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true})
vim.keymap.set("i", "<A-2>", "<Esc>:BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true})
vim.keymap.set("i", "<A-3>", "<Esc>:BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true})
vim.keymap.set("i", "<A-4>", "<Esc>:BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true})
vim.keymap.set("i", "<A-5>", "<Esc>:BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<Leader>b<Left>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<Leader>b<Right>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true})
-- stylua: ignore end
