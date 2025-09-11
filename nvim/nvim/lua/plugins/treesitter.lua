return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "windwp/nvim-ts-autotag" },
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-ts-autotag")
    config.setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "elixir",
        "heex",
        "javascript",
        "html",
        "typescript",
        "tsx",
        "jsx",
      },
      auto_install = true,
      autotag = { enable = true },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
