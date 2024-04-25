local wezterm = require("wezterm")
return {
	-- color_scheme = 'termnial.sexy',
	color_scheme = "Fahrenheit",
	enable_tab_bar = false,
	font_size = 12.0,
	-- macos_window_background_blur = 40,
	macos_window_background_blur = 30,

	-- window_background_image = "/home/calivn/wallpapers/wallhaven-856dlk.png",
	-- window_background_image_hsb = {
	-- 	brightness = 0.1,
	-- 	hue = 1.0,
	-- 	saturation = 0.3,
	-- },
	-- window_background_opacity = 0.92,
	window_background_opacity = 1.0,
	-- window_background_opacity = 0.78,
	window_decorations = "RESIZE",
	keys = {
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
		{
			key = "m",
			mods = "CTRL",
			action = wezterm.action.Hide,
		},
	},
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
