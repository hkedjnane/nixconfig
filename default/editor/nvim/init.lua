-- lazy.nvim init
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set({'n', 'v',}, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

local set = vim.opt

set.colorcolumn = "80"
set.signcolumn = "number"
set.number = true
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4

require("lazy").setup("plugins")
