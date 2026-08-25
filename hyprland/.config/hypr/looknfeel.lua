-- Change the default Omarchy look'n'feel.

hl.config({
  misc = {
    vrr = 1,
  },
})

-- Caelestia-style workspace slide. Omarchy defaults keep workspaces off.
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "menu_decel", style = "slide" })
