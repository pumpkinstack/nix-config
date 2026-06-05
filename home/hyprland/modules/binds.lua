local mod = "SUPER"
local terminal = "kitty"
local fileManager = "nautilus"
local browser = "zen-beta"
local codeEditor = "codium"

-- Window Management
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + M",hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

-- Applications
hl.bind(mod .. " + Return",       hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + CTRL + Return",hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mod .. " + E",            hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + SHIFT + V",    hl.dsp.exec_cmd(codeEditor))
hl.bind(mod .. " + B",            hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + SHIFT + W",    hl.dsp.exec_cmd("wallpaper-set"))
hl.bind(mod .. " + H",            hl.dsp.exec_cmd("heroic"))
hl.bind(mod .. " + U",            hl.dsp.exec_cmd("upscayl"))
hl.bind(mod .. " + Y",            hl.dsp.exec_cmd("pear-desktop"))
hl.bind(mod .. " + CTRL + W",     hl.dsp.exec_cmd("waypaper"))
hl.bind(mod .. " + D",     hl.dsp.exec_cmd("discord"))

-- Focus
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "d" }))

-- Move windows
hl.bind(mod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))

-- Scrolling layout
hl.bind(mod .. " + period",       hl.dsp.layout("move +col"))
hl.bind(mod .. " + comma",        hl.dsp.layout("move -col"))
hl.bind(mod .. " + SHIFT + period", hl.dsp.layout("swapcol r"))
hl.bind(mod .. " + SHIFT + comma",  hl.dsp.layout("swapcol l"))
hl.bind(mod .. " + A",            hl.dsp.layout("fit active"))
hl.bind(mod .. " + SHIFT + A",    hl.dsp.layout("fit visible"))
hl.bind(mod .. " + W",            hl.dsp.layout("colresize +conf"))
hl.bind(mod .. " + ALT + W",      hl.dsp.layout("colresize -conf"))

-- Column resize (repeating)
hl.bind(mod .. " + CTRL + right", hl.dsp.layout("colresize +0.05"), { repeating = true })
hl.bind(mod .. " + CTRL + left",  hl.dsp.layout("colresize -0.05"), { repeating = true })

-- Workspaces
for i = 1, 9 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i,  hl.dsp.window.move({ workspace = i }))
end
hl.bind(mod .. " + 0",       hl.dsp.focus({ workspace = 10 }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Scroll through workspaces
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "m-1" }))

-- Screenshot
hl.bind("Print",              hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mod .. " + Print",        hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mod .. " + SHIFT + Print",hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- Volume
hl.bind("XF86AudioMute",    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),        { repeating = true })

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })

-- Clipboard
hl.bind(mod .. " + V", hl.dsp.exec_cmd("sh -c 'cliphist list | rofi -dmenu -p \"Clipboard\" | cliphist decode | wl-copy'"))

-- Mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })