return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"clangd",
					"angularls",
					"tailwindcss",
					"html",
					"cssls",
					"pylsp",
					"ruby_lsp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("java").setup()
			vim.lsp.enable("jdtls")

			vim.lsp.config("ruby_lsp", {
				cmd = { "ruby-lsp" },
				init_options = {
					formatter = "rubocop",
					linters = { "rubocop" },
				},
				capabilities = capabilities,
			})

			vim.lsp.enable("ruby_lsp")

			vim.lsp.config("sorbet", {
				-- cmd = { "bundle", "exec", "srb", "tc", "--lsp"},
				cmd = { "bundle", "exec", "srb", "tc", "--lsp", "--disable-watchman" },
				capabilities = capabilities,
			})

			vim.lsp.enable("sorbet")

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("pylsp", {
				capabilities = capabilities,
			})
			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})
			vim.lsp.config("html", {
				capabilities = capabilities,
			})
			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
			})
			vim.lsp.config("angularls", {
				capabilities = capabilities,
			})
			vim.lsp.config("jdtls", {
				capabilities = capabilities,
			})
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})

			vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "]e", function()
				vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
			end, { desc = "next error" })

			vim.keymap.set("n", "[e", function()
				vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end, { desc = "previous error" })
		end,
	},
}
