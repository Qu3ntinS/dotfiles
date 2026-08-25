-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

hl.config({
  input = {
    kb_layout = "de",
    kb_options = "compose:caps",
    repeat_rate = 40,
    repeat_delay = 600,
    numlock_by_default = true,
    sensitivity = -0.7,

    touchpad = {
      natural_scroll = true,
      scroll_factor = 0.4,
    },
  },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({ name = "logitech-pro-x-wireless-2", sensitivity = -0.7 })
hl.device({ name = "logitech-usb-receiver", sensitivity = -0.7 })
hl.device({ name = "elan06d8:00-04f3:3195-touchpad", sensitivity = 0 })
