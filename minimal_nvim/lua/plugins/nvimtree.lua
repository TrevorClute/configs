return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        side = "right",
        adaptive_size = true,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true
      },
      renderer = {
        full_name = true,
        group_empty = false,
        special_files = {},
        symlink_destination = false,
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = true,
          },
        },
      },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
        vim.keymap.set('n', 'K', "5k" ,opts('5k'))
        vim.keymap.set('n', 'J', "5j" ,opts('5k'))
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      end
    })
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
  end,
}
