-- adds color to string color hex
return {
  "uga-rosa/ccc.nvim",
  config = function ()
    require("ccc").setup({
      highlighter = {
        auto_enable = true,
        lsp = true,
        update_insert = true,
      }
    })
  end
}
