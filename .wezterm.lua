local wezterm = require 'wezterm'
local config = {}
local gpus = wezterm.gui.enumerate_gpus()

-- Font configuration
config.font = wezterm.font('BlexMono Nerd Font')
config.font_size = 10

-- Cursor configuration
config.default_cursor_style = 'SteadyUnderline'

-- Performance settings
config.max_fps = 120
config.webgpu_preferred_adapter = gpus[0]
config.front_end = 'WebGpu'
config.prefer_egl = true
config.webgpu_power_preference = "HighPerformance"

-- Window appearance
config.window_decorations = 'NONE'
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
  font = wezterm.font('BlexMono Nerd Font'),
  font_size = 9.0,
}
config.adjust_window_size_when_changing_font_size = false
config.window_close_confirmation = 'NeverPrompt'

-- Linux-specific settings
config.enable_wayland = true
config.enable_kitty_keyboard = true

--
config.colors = {
  background = '#131313',
  foreground = '#E9E9E9',
  cursor_bg = '#E9E9E9',
  cursor_fg = '#131313',
  cursor_border = '#E9E9E9',
  selection_bg = '#79A6DA',
  selection_fg = '#131313',
  
  ansi = {
    '#000000', -- black
    '#D54E53', -- red
    '#B9CA49', -- green
    '#E7C547', -- yellow
    '#79A6DA', -- blue
    '#C397D8', -- magenta
    '#70C0B1', -- cyan
    '#FFFEFE', -- white
  },
  
  brights = {
    '#666666', -- bright black
    '#D44D53', -- bright red
    '#B9C949', -- bright green
    '#E6C446', -- bright yellow
    '#79A6DA', -- bright blue
    '#C396D7', -- bright magenta
    '#70C0B1', -- bright cyan
    '#FFFEFE', -- bright white
  },
}

-- Disable update checking
config.check_for_updates = false

-- Additional recommended configurations
config.audible_bell = 'SystemBeep'

-- Scrollback and history
config.scrollback_lines = 10000
config.enable_scroll_bar = false

config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- Key bindings for common operations
config.keys = {
  -- Split panes
  { key = 'h', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  
  -- Navigate panes
  { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Down' },
  
  -- Copy/paste
  { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom 'Clipboard' },
}

-- Mouse configurations
config.mouse_bindings = {
  -- Right click paste
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
}

-- Tab management
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.show_new_tab_button_in_tab_bar = false

-- Text selection
config.selection_word_boundary = ' \t\n{}[]()"\'-.,;:'

-- Hyperlink rules for URLs
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Quick select mode for URLs and file paths
table.insert(config.keys, {
  key = 'u',
  mods = 'CTRL|SHIFT',
  action = wezterm.action.QuickSelect,
})

-- Search mode
table.insert(config.keys, {
  key = 'f',
  mods = 'CTRL|SHIFT',
  action = wezterm.action.Search { CaseSensitiveString = '' },
})

-- Close pane
table.insert(config.keys, {
  key = 'w',
  mods = 'CTRL|SHIFT',
  action = wezterm.action.CloseCurrentPane { confirm = true },
})


return config
