-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all
-- Kanshi owns the docked layout (mode, position, transform). These lines only
-- pin scale 1 so 4K panels used at 1080p are not auto-scaled to 2x.

local omarchy_gdk_scale = 1
local omarchy_monitor_scale = 1

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

for i = 1, 10 do
  hl.monitor({ output = "DP-" .. i, mode = "preferred", position = "auto", scale = 1 })
end

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })
