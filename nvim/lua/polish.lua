-- Remove the line that prevents execution
-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

-- Function to set the theme based on the background mode
local function set_theme()
  if vim.o.background == "light" then
    -- Setup for vscode light theme
    local c = require('vscode.colors').get_colors()
    require('vscode').setup({
      style = 'light',
      transparent = false,      -- Enable transparent background
      italic_comments = true,  -- Enable italic comments
      underline_links = true,  -- Underline `@markup.link.*` variants
      disable_nvimtree_bg = true, -- Disable nvim-tree background color
      color_overrides = {
        vscLineNumber = '#000000',  -- Customize line number color for light mode
      },
      group_overrides = {
        -- Customize highlight groups using theme colors
        Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
      }
    })
    vim.cmd("colorscheme vscode")  -- Apply vscode theme
  else
    -- Setup for gruvbox dark theme
    vim.cmd("colorscheme gruvbox")  -- Apply gruvbox theme
  end
end

-- Automatically set the theme when `background` option changes
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = set_theme,
})

-- Set the initial background (either "light" or "dark")
vim.o.background = "light"  -- Change to "light" if you prefer light mode as the default

-- Apply the initial theme
set_theme()

