-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- shellをpwshに(windowsのみ)
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.default_prog = { "pwsh.exe" }
end

--# Colors & Appearance
config.color_scheme = "Tokyo Night"
config.window_padding = {
    left = 4,
    right = 4,
    top = 2,
    bottom = 2,
}
config.text_background_opacity = 0.3
config.window_background_opacity = 0.8

config.window_decorations = "RESIZE"

--# Key Binding
config.keys = {
    {
        key = "F1",
        action = wezterm.action.ActivateCommandPalette,
    },
    {
        key = "P",
        mods = "CTRL",
        action = wezterm.action.DisableDefaultAssignment,
    },
}

-- Finally, return the configuration to wezterm:
return config
