return {
  "willmcpherson2/gnome.nvim",
  config = function()
    require("gnome").setup {
      -- these are the default options and can be omitted
      on_light = function()
        vim.o.background = "light"
      end,
      on_dark = function()
        vim.o.background = "dark"
      end,
    }
  end
}
