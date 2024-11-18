
-- Remove the line that prevents execution
-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Function to set the theme based on the background mode
local function set_theme()
  if vim.o.background == "light" then
    vim.cmd("colorscheme onedark")  -- Apply modus theme
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
vim.o.background = "dark"  -- Change to "light" if you prefer light mode as the default

local function neotree_to_the_right()
  -- Function to set neotree to the right
  -- Set neotree to the right
  vim.cmd("Neotree right")
end
-- Apply the initial theme
set_theme()
neotree_to_the_right()




