
-- Remove the line that prevents execution
-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Function to set the theme based on the background mode
-- local function set_theme()
--   if vim.api.nvim_get_option("background") == "light" then
--     vim.o.background = "light"
--     vim.cmd("colorscheme onedark")  -- Apply onedark
--     vim.api.nvim_set_option("background", "light")
--   else
--     -- Setup for gruvbox dark theme
--     vim.cmd("colorscheme gruvbox")  -- Apply gruvbox theme
--     vim.o.background = "dark"
--     vim.api.nvim_set_option("background", "dark")
--   end
-- end

-- Automatically set the theme when `background` option changes
-- vim.api.nvim_create_autocmd("OptionSet", {
--   pattern = "background",
--   callback = set_theme,
-- })

-- Set the initial background (either "light" or "dark")
-- vim.o.background = "light"  -- Change to "light" if you prefer light mode as the default

-- local function neotree_to_the_right()
--   -- Function to set neotree to the right
--   -- Set neotree to the right
--   vim.cmd("Neotree right")
-- end
-- Apply the initial theme
-- set_theme()
-- neotree_to_the_right()

-- Function to get system theme and set vim background accordingly
-- local function get_theme()
--     -- Run the gsettings command and capture output
--     local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
--     if not handle then return end
--     
--     local result = handle:read("*a")
--     handle:close()
--     
--     -- Set vim background based on system theme
--     if result:match("dark") then
--         vim.o.background = "dark"
--     else
--         vim.o.background = "light"
--     end
-- end
--
-- -- Execute the function
-- get_theme()
vim.keymap.set("n", "<leader>a", "<cmd>AssistantToggle<cr>", { desc = "Assistant window toggle" })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree position=right toggle<cr>", { desc = "Toggle Explorer" })
vim.g.neovide_hide_mouse_when_typing = true
vim.g.Illuminate_ftblacklist = {'*'}  -- Disable for all file types
