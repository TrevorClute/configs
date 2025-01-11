vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = false })
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
vim.keymap.set("n", "<leader>c", "<C-w>c", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>o", "<C-w>o", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>ss", ":%s/", { noremap = true, silent = false })

vim.opt.termguicolors = true
vim.wo.relativenumber = true
vim.opt.wrap = false
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.autoindent = true
vim.opt.smarttab = true

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

--lualine
--
local colors = {
	red = "#ca1243",
	grey = "#555555",
	black = "#333333",
	white = "#161616",
	light_green = "#ffa6c1",
	orange = "#fe8019",
	green = "#8ec07c",
	-- red = "#90d5ff"
}

local theme = {
	normal = {
		a = { fg = "#ffffff", bg = colors.red },
		b = { fg = "#ffffff", bg = colors.grey },
		c = { fg = "#ffffff", bg = colors.white },
		z = { fg = "#ffffff", bg = colors.red },
	},
	insert = { a = { fg = colors.black, bg = colors.light_green } },
	visual = { a = { fg = colors.black, bg = colors.orange } },
	replace = { a = { fg = colors.black, bg = colors.green } },
	command = { a = { fg = "#000000", bg = colors.green } },
}

local empty = require("lualine.component"):extend()
function empty:draw(default_highlight)
	self.status = ""
	self.applied_separator = ""
	self:apply_highlights(default_highlight)
	self:apply_section_separators()
	return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
	for name, section in pairs(sections) do
		local left = name:sub(9, 10) < "x"
		for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
			table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
		end
		for id, comp in ipairs(section) do
			if type(comp) ~= "table" then
				comp = { comp }
				section[id] = comp
			end
			comp.separator = left and { right = "" } or { left = "" }
		end
	end
	return sections
end

local function search_result()
	if vim.v.hlsearch == 0 then
		return ""
	end
	local last_search = vim.fn.getreg("/")
	if not last_search or last_search == "" then
		return ""
	end
	local searchcount = vim.fn.searchcount({ maxcount = 9999 })
	return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

local function modified()
	if vim.bo.modified then
		return "+"
	elseif vim.bo.modifiable == false or vim.bo.readonly == true then
		return "-"
	end
	return ""
end

require("lualine").setup({
	options = {
		theme = theme,
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
	sections = process_sections({
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				source = { "nvim" },
				sections = { "error" },
				diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
			},
			{
				"diagnostics",
				source = { "nvim" },
				sections = { "warn" },
				diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
			},
			-- { 'filename', file_status = false, path = 1 },
			{ "filename", file_status = false },
			{ modified, color = { bg = colors.red } },
			{
				"%w",
				cond = function()
					return vim.wo.previewwindow
				end,
			},
			{
				"%r",
				cond = function()
					return vim.bo.readonly
				end,
			},
			{
				"%q",
				cond = function()
					return vim.bo.buftype == "quickfix"
				end,
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { search_result, "filetype" },
		-- lualine_z = { '%l:%c', '%p%%/%L' },
		lualine_z = { "%l:%c" },
	}),
	inactive_sections = {
		lualine_c = { "%f %y %m" },
		lualine_x = {},
	},
})
