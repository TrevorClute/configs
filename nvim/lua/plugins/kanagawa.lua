return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      colors = {
        palette = {
          sumiInk0 = "#333333", -- border
          sumiInk6 = "#555555", -- line nums

          fujiWhite = "#ffffff", --vars
          springGreen = "#89fe8c", --strings
          carpYellow = "#f5e9a4", --identifier
          crystalBlue = "#90d5ff", --function
          waveAqua2 = "#93e9bf", -- types
          oniViolet = "#ffa6c1", --keyword
          springBlue = "#93e9bf", --special
          sakuraPink = "#b08bff", -- nums
          springViolet2 = "#aaaaaa", --punc
          oniViolet2 = "#ffffff", -- params
        },
        theme = {
          wave = {
            ui = {
              bg = "#161616",
              bg_gutter = "none",
            },
            syn = {
              -- constant = "#ffffff",
              -- string = "#85d680",
              -- identifier = "#f5e9a4",
              -- fun = "#ffa6c1",
              -- type = "#ffffff",
              operator = "#ffa6c1",
              -- keyword = "#90d5ff",
              -- statement = "#90d5ff",
              -- special1 = "#92ecbf",
              special3 = "#ffa6c1",
            },
          },
        },
      },
    })

    vim.cmd("colorscheme kanagawa")
  end,
}
