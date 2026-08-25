-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- Output profiles from ~/.config/kanshi/config (docked-office / docked-home / undocked).
o.exec_on_start("kanshi")

-- Netbird after network is up.
o.exec_on_start(os.getenv("HOME") .. "/.config/hypr/netbird-autostart.sh")
