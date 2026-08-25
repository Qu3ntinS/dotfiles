-- Per-monitor workspaces (replaces the old hyprpm C++ plugin).
-- Hyprland 0.56 Lua dispatchers cannot call split-workspace via hyprctl.
--
-- Prepend the plugin lua dir so require("monitors") hits the plugin, not
-- ~/.config/hypr/monitors.lua. Clear cached names on each reload.

local plugin_lua = os.getenv("HOME") .. "/.config/hypr/plugins/split-monitor-workspaces/lua"
package.path = plugin_lua .. "/?.lua;" .. package.path

for _, name in ipairs({
  "split-monitor-workspaces",
  "monitors",
  "globals",
  "helpers",
  "dispatchers",
}) do
  package.loaded[name] = nil
end

local smw = require("split-monitor-workspaces")

smw.setup({
  workspace_count = 10,
  keep_focused = true,
  enable_notifications = true,
  enable_persistent_workspaces = true,
  enable_wrapping = false,
})

for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  hl.unbind("SUPER + " .. key)
  hl.unbind("SUPER + SHIFT + " .. key)
  hl.unbind("SUPER + SHIFT + ALT + " .. key)
  o.bind("SUPER + " .. key, "Switch to workspace " .. workspace, smw.workspace(tostring(workspace)))
  o.bind(
    "SUPER + SHIFT + " .. key,
    "Move window to workspace " .. workspace,
    smw.move_to_workspace(tostring(workspace))
  )
end

hl.unbind("SUPER + TAB")
hl.unbind("SUPER + SHIFT + TAB")
o.bind("SUPER + TAB", "Next workspace", smw.cycle_workspaces("next"))
o.bind("SUPER + SHIFT + TAB", "Previous workspace", smw.cycle_workspaces("prev"))

hl.unbind("SUPER + mouse_down")
hl.unbind("SUPER + mouse_up")
o.bind("SUPER + mouse_down", "Scroll workspace forward", smw.cycle_workspaces("next"))
o.bind("SUPER + mouse_up", "Scroll workspace backward", smw.cycle_workspaces("prev"))

-- Was split-changemonitor. Native monitor focus; plugin has no changemonitor API.
hl.unbind("SUPER + SHIFT + N")
hl.unbind("SUPER + SHIFT + M")
o.bind("SUPER + SHIFT + N", "Focus next monitor", hl.dsp.focus({ monitor = "+1" }))
o.bind("SUPER + SHIFT + M", "Focus previous monitor", hl.dsp.focus({ monitor = "-1" }))
