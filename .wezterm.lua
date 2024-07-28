-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold all the configuration options
local config = {}

-- Appearance
config.color_scheme = "Apprentice (Gogh)" -- Use the Apprentice color scheme
config.font = wezterm.font("MesloLGS Nerd Font Mono") -- Set the font to MesloLGS Nerd Font Mono
config.font_size = 16.0
config.line_height = 1.2
config.window_background_opacity = 0.95
config.text_background_opacity = 1.0

-- Tab Bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false

-- Window
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false

-- Scrollback
config.enable_scroll_bar = true
config.scrollback_lines = 5000

-- Key bindings
config.keys = {
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
	{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action({ SpawnTab = "DefaultDomain" }) },
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTabRelative = -1 }) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{
		key = "=",
		mods = "CTRL",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{ key = "LeftArrow", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "RightArrow", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "UpArrow", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "DownArrow", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "x", mods = "CTRL", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
}

-- Mouse bindings
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action({ PasteFrom = "Clipboard" }),
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action({ CompleteSelection = "PrimarySelection" }),
	},
}

-- Enable Wayland (for Linux users)
config.enable_wayland = true

-- Multiplexing
config.unix_domains = {
	{
		name = "unix",
	},
}
config.default_gui_startup_args = { "connect", "unix" }

-- Set the default program
config.default_prog = { "/bin/zsh", "-l" } -- Corrected to use /bin/zsh

-- Miscellaneous
config.check_for_updates = false
config.audible_bell = "Disabled"

-- Return the configuration to wezterm
return config
