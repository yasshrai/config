-- Basic settings for lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- relativenumber
vim.opt.number = true
vim.opt.relativenumber = true

-- Terminal setup
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

-- Resize splits easily
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- Optional: mouse resize
vim.opt.mouse = "a"

-- ColorScheme
vim.cmd("colorscheme slate")

-- Tab 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true


-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


require("config.lazy")

