----------------------
---- DEFINE LOCAL ----
----------------------

-- Set programs that you use
local terminal = "kitty"
local fileManager = "nemo"
local fileManager2 = "kitty -e yazi -- --show-hidden"
local menu = "rofi -show drun"
local browser = "zen-browser"
local wallpaper = "waypaper"

-- Set Mod shortcuts
local mainMod = "SUPER"
local shiftMod = "SUPER + SHIFT"

------------------------
---- DEFINE SCRIPTS ----
------------------------

local clipboard = "~/.config/hypr/scripts/clipboard_menu"
local quickMenu = "~/.config/hypr/scripts/quick_menu"
local waybarReload = "~/.config/waybar/scripts/launch_waybar"

---------------------------------
---- APPLICATION KEYBINDINGS ----
---------------------------------

-- Open terminal
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))

-- hl.bind(" ALT + mouse:274", hl.dsp.exec_cmd()

-- Open file manager
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

-- Open alternate file manager
hl.bind(shiftMod .. " + E", hl.dsp.exec_cmd(fileManager2))

-- Open wallpaper daemon
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(wallpaper))

-- Open application launcher menu
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))

-- Open Browser
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

----------------------------
---- TOOLS KEYBINDINGS ----
----------------------------

-- Open clipboard menu
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))

-- Quick Menu
hl.bind(shiftMod .. " + P", hl.dsp.exec_cmd(quickMenu))

-- Alt+Tab (standard MRU)
hl.bind("ALT + Tab", hl.dsp.exec_cmd("snappy-switcher next --mod alt"))

-- Super+Tab (workspace-filtered)
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("snappy-switcher next --workspace --mod super"))

-- Screenshot
hl.bind(shiftMod .. " + S", hl.dsp.exec_cmd("hyprshot -m region --raw | satty --filename -"))

----------------------------
---- SYSTEM KEYBINDINGS ----
----------------------------

-- Wlogout Menu
hl.bind(shiftMod .. " + X", hl.dsp.exec_cmd("wlogout"))

-- Logout/Open Login screen fallback
hl.bind(shiftMod .. " + M", hl.dsp.exec_cmd("loginctl kill-session $XDG_SESSION_ID"))

-- Window pseudo
hl.bind(shiftMod .. " + O + P", hl.dsp.window.pseudo())

-- Toggle Window Float
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))

-- Reload waybar config
hl.bind(shiftMod .. " + R", hl.dsp.exec_cmd(waybarReload))

--Toggle battery charge_type (Conservation/Full Charge)
hl.bind(shiftMod .. " + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle_battery"))

--Display Monitor Menu
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/.config/hypr/scripts/monitor_menu"))

-------------------------------
---- WORKSPACE KEYBINDINGS ----
-------------------------------

-- Close open window
hl.bind(shiftMod .. " + Q", hl.dsp.window.close())

-- Toggle Split in dwindle layout only
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Workspaces Setup
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	-- Switch workspaces with "mainMod + [0-9]"
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	-- Move active window to a workspace with "shiftMod + [0-9]""
	hl.bind(shiftMod .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + grave", hl.dsp.workspace.toggle_special("magic"))
hl.bind(shiftMod .. " + grave", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

----------------------------
---- LAPTOP KEYBINDINGS ----
----------------------------

-- Laptop multimedia keys for volume and LCD brightness

-- Volume (+)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)

-- Volume (-)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)

-- Volume SPEAKER-OUTPUT_MUTE
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)

-- Volume MIC-INPUT_MUTE
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

-- Monitor Brightness (+)

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })

-- Monitor Brightness (-)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Multimedia Play
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

-- Multimedia Pause
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

-- Multimedia Previous
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Multimedia Next
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
