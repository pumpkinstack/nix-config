local primary = "0xff{color2.strip}"
local surface = "0xff{background.strip}"
local secondary = "0xff{color3.strip}"
local error = "0xff{color1.strip}"
local outline = "0xff{color8.strip}"

hl.config({
    general = {
        col = {
            active_border = primary,
            inactive_border = outline,
        },
    },
    group = {
        col = {
            border_active = secondary,
            border_inactive = surface,
            border_locked_active = error,
            border_locked_inactive = surface,
        },
        groupbar = {
            col = {
                active = secondary,
                inactive = surface,
                locked_active = error,
                locked_inactive = surface,
            },
        },
    },
})

return {
    colors = { primary = primary, surface = surface, secondary = secondary, error = error, outline = outline },
}