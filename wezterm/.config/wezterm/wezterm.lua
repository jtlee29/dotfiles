local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE", -- disable title bar but allow resize

	color_scheme = "Catppuccin Mocha",
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" }),
	font_size = 16,

	background = {
		{
			-- Add the same thing but for arch system
			source = {
				File = "/Users/justin.lee/.config/wezterm/background-images/purple-curves-blurred.png",
			},
			hsb = {
				hue = 1.0,
				saturation = 1.02,
				brightness = 0.25,
			},
		},
		{
			source = { Color = "#272c35" },
			opacity = 0.55,
		},
	},

	macos_window_background_blur = 30,
}

return config
