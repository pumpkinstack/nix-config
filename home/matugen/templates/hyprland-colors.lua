local primary = "0xff{{colors.primary.default.hex_stripped}}"
local surface = "0xff{{colors.surface.default.hex_stripped}}"
local secondary = "0xff{{colors.secondary.default.hex_stripped}}"
local error = "0xff{{colors.error.default.hex_stripped}}"
local outline = "0xff{{colors.outline.default.hex_stripped}}"

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