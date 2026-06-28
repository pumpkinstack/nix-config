hl.config({
    animations = {
        enabled = true,
    }
})

--------------------------------------------------------------------------------
-- Animation Curves (Bezier)
--------------------------------------------------------------------------------
hl.curve("portal", { type = "bezier", points = { {0.25, 0.73}, {0, 0.31} } })
hl.curve("graceful", { type = "bezier", points = { {0.25, 1}, {0.5, 1} } })
hl.curve("strike", { type = "bezier", points = { {0.2, 0.95}, {0.2, 1.05} } })
hl.curve("ethereal", { type = "bezier", points = { {0.4, 0.0}, {0.2, 1} } })
hl.curve("drawback", { type = "bezier", points = { {1.00, 1.02}, {0.20, -0.46} } })
hl.curve("arcane",    { type = "bezier", points = { {0.22, 1.2}, {0.36, 1.0} } })
hl.curve("vanish",    { type = "bezier", points = { {0.7,  0.0}, {1.0,  0.6} } })
hl.curve("conjure",   { type = "bezier", points = { {0.34, 1.56}, {0.64, 1.0} } })
hl.curve("drift",     { type = "bezier", points = { {0.45, 0.0}, {0.55, 1.0} } })

--------------------------------------------------------------------------------
-- Animation Rules
--------------------------------------------------------------------------------
hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "conjure", style = "gnomed" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "drift", style = "gnomed" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "vanish", style = "gnomed" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "drift" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "ethereal" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "drift" })
hl.animation({ leaf = "layers", enabled = true, speed = 5, bezier = "ethereal", style = "fade" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "graceful", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.6, bezier = "vanish", style = "slide" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "conjure" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 4.5, bezier = "vanish" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 8, bezier = "ethereal", style = "slidefade 15%" })