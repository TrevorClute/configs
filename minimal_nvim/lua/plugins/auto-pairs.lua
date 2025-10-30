return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    config = function ()
      require("nvim-ts-autotag").setup()
    end

  }
}
