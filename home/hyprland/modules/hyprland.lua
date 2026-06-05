require("inputs")
require("autostart")
require("animations")
require("binds")
require("layout")
require("general")
require("decorations")
require("window-rules")
require("gestures")

hl.monitor({
  output = "eDP-1",
  mode = "1920x1080@144",
  position = "0x0",
  scale = 1,
})

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")