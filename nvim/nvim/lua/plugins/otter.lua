return {
	"jmbuhr/otter.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
    vim.keymap.set("n", "<leader>oa", function()
      require("otter").activate({ "python" })
    end, { desc = "Otter Activate" })
	end,
}
