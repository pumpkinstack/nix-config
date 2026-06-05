local colors = require("hyprland-colors")
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = colors.primary,
            inactive_border = colors.outline,
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "scrolling",
    }
})