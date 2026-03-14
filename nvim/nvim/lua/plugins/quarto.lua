-- plugins/quarto.lua
return {
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("quarto").setup({
				debug = false,
				closePreviewOnExit = true,
				lspFeatures = {
					enabled = true,
					chunks = "all",
					languages = { "r", "python", "julia", "bash", "html","python3"},
					diagnostics = {
						enabled = true,
						triggers = { "BufWritePost" },
					},
					completion = {
						enabled = true,
					},
				},
				codeRunner = {
					enabled = true,
					default_method = "molten", -- "molten", "slime", "iron" or <function>
				},
			})
      vim.keymap.set("n", "<leader>ra", ":QuartoSendAll<CR>", { desc = "Run All Cells" })
      vim.keymap.set("n", "<leader>rc", ":QuartoSend<CR>", { desc = "Run Cell" })
		end,
	},
}
