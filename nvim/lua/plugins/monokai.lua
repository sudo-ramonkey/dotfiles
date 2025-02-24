return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "monokai-pro",
    },
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        filter = "spectrum",
        background_clear = {
          "toggleterm",
          "telescope",
          "renamer",
          "notify",
          "which-key",
        },
        overridePalette = function(filter)
          return {
            dark2 = "#121212",
            dark1 = "#121212",
            background = "#121212",
            accent1 = "#f92672", -- pink/red
            accent2 = "#fd971f", -- orange
            accent3 = "#e6db74", -- yellow
            accent4 = "#a6e22e", -- green
            accent5 = "#66d9ef", -- cyan
            accent6 = "#ae81ff", -- purple
            text = "#f8f8f2",
          }
        end,
        transparent_background = false,
        terminal_colors = true,
      })
    end,
  },
}
