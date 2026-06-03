local colors = require("hyprland-colors")
hl.config({
    general = {
        gaps_in  = 6,
        gaps_out = 12,
        border_size = 2,
        col = {
            active_border = colors.primary .. " " .. colors.secondary .. " 45deg",
            inactive_border = colors.tertiary,
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "scrolling",
    }
})