return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 80
            vim.api.nvim_set_hl(0, "MoltenCell", { bg = "none" })
            vim.g.molten_use_signs = true
            vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv")
            vim.keymap.set("n", "<leader>re", ":MoltenReevaluateCell<CR>", { desc = "Initialize Molten", silent = true })
            vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Initialize Molten", silent = true })
            vim.keymap.set("n", "<leader>cc", ":MoltenInterrupt<CR>", { desc = "interrupt molten", silent = true })
            vim.keymap.set("n", "<leader>ms", ":MoltenSave<CR>", { desc = "save molten", silent = true })
            vim.keymap.set("n", "<leader>ml", ":MoltenLoad<CR>", { desc = "save molten", silent = true })
            vim.keymap.set("n", "<leader>s", ":noautocmd MoltenEnterOutput<CR>", { desc = "Show Output" })
            vim.keymap.set("n", "<leader>h", ":MoltenHideOutput<CR>")
            vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>")
        end,
    },
}
