return {
  "ThePrimeagen/harpoon",
  opts = {
    global_settings = {
      tabline = true,
      tabline_suffix = " ",
      tabline_prefix = " ",
    },
  },
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
      vim.cmd(":do User")
    end)
    vim.keymap.set("n", "<leader>t", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
      vim.cmd(":do User")
    end)

    vim.keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<leader>2", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<leader>3", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<leader>4", function()
      harpoon:list():select(4)
    end)
    vim.keymap.set("n", "<leader>5", function()
      harpoon:list():select(5)
    end)
    vim.keymap.set("n", "<leader>6", function()
      harpoon:list():select(6)
    end)
    vim.keymap.set("n", "<leader>7", function()
      harpoon:list():select(7)
    end)
    vim.keymap.set("n", "<leader>8", function()
      harpoon:list():select(8)
    end)
    vim.keymap.set("n", "<leader>9", function()
      harpoon:list():select(9)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-b>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-n>", function()
      harpoon:list():next()
    end)

    function Harpoon_files()
      local contents = {}
      local marks_length = harpoon:list():length()
      local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
      local emojiNumbers = {
        "¹", "²", "³", "⁴", "⁵", "⁶", "⁷", "⁸", "⁹"
      }
      for index = 1, marks_length do
        local harpoon_file_path = harpoon:list():get(index).value
        local file_name = harpoon_file_path == "" and "(empty)" or vim.fn.fnamemodify(harpoon_file_path, ":t")

        if current_file_path == harpoon_file_path then
          contents[index] = string.format("  ⭐️%%#HarpoonActive#%s⭐️", file_name)
        else
          contents[index] =
              string.format("  %%#HarpoonNumberInactive#%s%%#HarpoonInactive#%s", emojiNumbers[index], file_name)
        end
      end

      return table.concat(contents)
    end

    vim.opt.showtabline = 2
    vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "User"}, {
      callback = function(ev)
        vim.o.tabline = Harpoon_files()
      end,
    })
  end,
}
