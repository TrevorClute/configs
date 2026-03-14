vim.g.mapleader = " "
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = false })
vim.keymap.set({ "n", "v" }, "J", "5j", { noremap = true, silent = false })
vim.keymap.set({ "n", "v" }, "K", "5k", { noremap = true, silent = false })
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { noremap = true, silent = false })
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>j", "J", { noremap = true, silent = false })
vim.keymap.set("n", "<C-h>", "<C-W>h", { noremap = true, silent = false })
vim.keymap.set("n", "<C-j>", "<C-W>j", { noremap = true, silent = false })
vim.keymap.set("n", "<C-k>", "<C-W>k", { noremap = true, silent = false })
vim.keymap.set("n", "<C-l>", "<C-W>l", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>s", "<C-w><C-6>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>cw", "<C-w>c", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>ow", "<C-w>o", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>gs", ":%s/", { noremap = true, silent = false })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = false })
vim.keymap.set("n", "<C-o>", "<C-o>zz", { noremap = true, silent = false })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { noremap = true, silent = false })
vim.opt.termguicolors = true
vim.wo.relativenumber = true
vim.opt.wrap = false
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.autoindent = true
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

local opts = {}

require("lazy").setup("plugins")

