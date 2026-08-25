-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.
--
-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- Quattro swapped these. Restore: Space = apps, Alt+Space = Omarchy menu.
hl.unbind("SUPER + SPACE")
hl.unbind("SUPER + ALT + SPACE")
o.bind("SUPER + SPACE", "Apps menu", "omarchy-menu toggle apps")
o.bind("SUPER + ALT + SPACE", "Omarchy menu", "omarchy-menu toggle")

-- Essential quattro bind SUPER+SHIFT+RETURN is Browser. Old layout used SUPER+B.
hl.unbind("SUPER + SHIFT + RETURN")
o.bind("SUPER + ALT + RETURN", "Tmux", { omarchy = "terminal-tmux" })

-- Browser: was SUPER+SHIFT+RETURN / SUPER+SHIFT+B.
hl.unbind("SUPER + SHIFT + B")
o.bind("SUPER + B", "Browser", { omarchy = "browser" })
o.bind("SUPER + SHIFT + B", "Browser (private)", { omarchy = "browser --private" })

o.bind("SUPER + M", "Music", { omarchy = "spotify" })
o.bind("SUPER + N", "Editor", { omarchy = "editor" })

-- Was toggle floating (SUPER+T). Float is gone on this key.
hl.unbind("SUPER + T")
o.bind("SUPER + T", "Activity", { tui = "btop" })

o.bind("SUPER + D", "Docker", { tui = "lazydocker" })

-- Was pop window out (SUPER+O). Pop is gone on this key.
hl.unbind("SUPER + O")
o.bind("SUPER + O", "Obsidian", {
  launch = "obsidian -disable-gpu --enable-wayland-ime",
  focus = "obsidian",
})

-- Was monitor scaling (SUPER+SLASH).
hl.unbind("SUPER + SLASH")
o.bind("SUPER + SLASH", "Passwords", { omarchy = "1password" })

o.bind("SUPER + A", "ChatGPT", { webapp = "https://chatgpt.com" })

-- Was ChatGPT.
hl.unbind("SUPER + SHIFT + A")
o.bind("SUPER + SHIFT + A", "Grok", { webapp = "https://grok.com" })

-- Was universal copy. Use CTRL+C or SUPER+CTRL+V for clipboard.
hl.unbind("SUPER + C")
o.bind("SUPER + C", "Calendar", { webapp = "https://app.hey.com/calendar/weeks/" })

o.bind("SUPER + E", "Email", { webapp = "https://app.hey.com" })
o.bind("SUPER + Y", "YouTube", { webapp = "https://youtube.com/", focus = true })

-- Was Signal / move-out-of-group.
hl.unbind("SUPER + SHIFT + G")
hl.unbind("SUPER + ALT + G")
o.bind("SUPER + SHIFT + G", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true })
o.bind("SUPER + ALT + G", "Google Messages", {
  webapp = "https://messages.google.com/web/conversations",
  focus = true,
})

-- Was universal cut. Use CTRL+X.
hl.unbind("SUPER + X")
hl.unbind("SUPER + SHIFT + X")
o.bind("SUPER + X", "X", { webapp = "https://x.com/" })
o.bind("SUPER + SHIFT + X", "X Post", { webapp = "https://x.com/compose/post" })

o.bind("SUPER + Q", "Clipboard", "walker -m clipboard")

-- Was Google Maps.
hl.unbind("SUPER + SHIFT + S")
o.bind("SUPER + SHIFT + S", "Snipping Tool", "omarchy capture screenshot smart copy")

hl.unbind("SUPER + SHIFT + CTRL + A")
o.bind("SUPER + SHIFT + CTRL + A", "Agent", "omarchy-agent --pick")

o.bind("SUPER + SHIFT + I", "Toggle Fingerprint Auth", "omarchy-toggle-fingerprint")
