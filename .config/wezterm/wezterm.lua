-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd) -- set startup Window position
    local tab, pane, window = mux.spawn_window(cmd or
        { position = { x = "10%", y = "10%" }, origin = "ActiveScreen" }
    )
end)

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Tabs
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'

-- Padding
config.window_padding = {
    left = 16,
    right = 16,
    top = 32,
    -- top = 16,
    bottom = 8,
}

config.max_fps = 240
config.front_end = 'WebGpu'
-- config.use_ime = true
-- config.key_map_preference = 'Physical'

-- Fonts
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
-- config.harfbuzz_features = {
--     "cv06=1",
--     "cv14=1",
--     "cv32=1",
--     "ss04=1",
--     "ss07=1",
--     "ss09=1",
-- }
config.font = wezterm.font_with_fallback {
    'MesloLGS Nerd Font',
    'PK Maehongson',
    -- 'Sukhumvit Set',
}
-- ซ้ำซ้อน
config.font_size = 14.0

-- Background
config.window_background_opacity = 0.85
config.macos_window_background_blur = 26
config.window_close_confirmation = 'NeverPrompt'
config.native_macos_fullscreen_mode = true

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

config.keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    { key = "LeftArrow",  mods = "OPT", action = wezterm.action { SendString = "\x1bb" } },
    -- Make Option-Right equivalent to Alt-f; forward-word
    { key = "RightArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bf" } },
}

-- and finally, return the configuration to wezterm
return config
