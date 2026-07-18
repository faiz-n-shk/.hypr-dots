-------------------
---- AUTOSTART ----
-------------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	-- Export variables to systemd
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")

	-- Start polkit daemon
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	-- Alt-Tab Daemon
	hl.exec_cmd("snappy-switcher --daemon")

	-- Mpd Services and Daemon
	hl.exec_cmd("systemctl --user start mpd")

	-- Start hyprpm plugins
	hl.exec_cmd("hyprpm reload -n")

	-- Start GPU Screen Recorder
	hl.exec_cmd("gsr-ui")

	-- Top Panel
	hl.exec_cmd("waybar")
	hl.exec_cmd("swaync")
	hl.exec_cmd("nm-applet --indicator")

	-- Wallpaper
	hl.exec_cmd("awww-daemon && waypaper --restore")

	-- Idle
	hl.exec_cmd("hyprsunset -t 4500")
	hl.exec_cmd("hypridle")

	-- Clipboard
	hl.exec_cmd("wl-paste --type text --watch cliphist store -max-items 500")
	hl.exec_cmd("wl-paste --type image --watch cliphist store -max-items 100")
end)
