-- Centered floating dialogs
local dialog_titles = {
    "Open File", "Select a File", "Choose wallpaper", "Open Folder",
    "Save As", "Library", "File Upload", "Select App",
    "Select Image", "Select Executable"
}
for _, t in ipairs(dialog_titles) do
    hl.window_rule({ match = { title = t .. ".*" }, float = true, center = true })
end

-- Picture-in-Picture
hl.window_rule({
    match = { title = "^Picture-in-Picture$" },
    float = true,
    pin   = true,
    move  = { "monitor_w * 0.695", "monitor_h * 0.04" },
})

-- App pinning and sizing
hl.window_rule({ match = { title = "^rofi - APPS$" }, pin = true })
hl.window_rule({ match = { title = "^Waypaper$" },    float = true })
hl.window_rule({ match = { title = "^Proton VPN$" },  float = true, size = { 800, 600 } })
hl.window_rule({ match = { title = "^Select App$" },  size = { 400, 200 } })

-- Opacity
hl.window_rule({ match = { class = "^org.gnome.Nautilus$" }, opacity = "0.90 override 0.90 override" })
hl.window_rule({ match = { class = "^kitty$" },              opacity = "0.80 override 0.90 override" })

-- Floating btop in kitty
hl.window_rule({ match = { class = "^kitty$", title = "^btop$" }, float = true })

hl.window_rule({ match = { class = "^zen-beta$" }, border_size = 0, no_shadow = true })

