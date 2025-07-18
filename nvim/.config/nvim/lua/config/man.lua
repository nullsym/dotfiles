-- Man pages
vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  callback = function(args)
    -- Get the buffer from the autocmd event
    local buf = args.buf

    vim.keymap.set("n", "<C-Space>", "<C-b>", {
      buffer = buf,
      desc = "Page Up",
    })

    vim.keymap.set("n", "<Space>", "<C-f>", {
      buffer = buf,
      desc = "Page Down",
    })

    -- Disable double space to navigate files
    vim.keymap.set("n", "<Space><Space>", "<Nop>", {
      buffer = buf,
      desc = "Disable double space",
    })

    -- Quit quickly
    vim.keymap.set("n", "q", "<cmd>q!<cr>", {
      buffer = buf,
      desc = "Quit quickly",
    })
  end,
})
