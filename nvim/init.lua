-- ========================
-- Basic settings
-- ========================
vim.opt.number = true
vim.opt.relativenumber = true

-- ========================
-- Terminal setup
-- ========================

-- Open terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert",
})

-- Easier escape from terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })

-- Command to open terminal at the bottom (like VS Code)
vim.api.nvim_create_user_command("Term", function()
  vim.cmd("botright split | terminal")
end, {})

-- ========================
-- Resize splits easily
-- ========================
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- ========================
-- Optional: mouse resize
-- ========================
vim.opt.mouse = "a"

vim.cmd("colorscheme slate")

