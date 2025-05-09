-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.warn_about_missing_glyphs = false
config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font_with_fallback({
	"Liga SFMonoNerdFont",
	"Iosevka Nerd Font",
	"JetBrains Mono",
})

config.font_size = 12.0

-- config.window_background_image = "/home/tao/Downloads/garga/gerez.png"
config.window_background_opacity = 0.8

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Dracula"

-- zen mode in nvim
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

wezterm.keys = {
	{
		key = "F",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SendString("\x06"), -- Send Ctrl+F
	},
	{
		key = "F",
		mods = "SUPER",
		action = wezterm.action.SendString("\x06"), -- keep win+f
	},
}

-- and finally, return the configuration to wezterm
return config
