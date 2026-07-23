-- Force pavucontrol to behave like a centered, floating menu
hl.window_rule({
	match = {
		class = ".*pavucontrol.*",
	},
	float = true,
	size = { 700, 600 },
	move = { "50%", 10 }, -- '50%' as a string, offset as integer
	pin = true,
})

-- Match ANY channel/stream starting with specified symbols
hl.window_rule({
	match = {
		class = "^(discord)$",
		title = "^[🔊🧊].*$",
	},
	opacity = 1.0,
	no_dim = true,
	no_blur = true,
	opaque = true,
})

-- Standard behavior (Matches titles that do NOT start with those symbols)
hl.window_rule({
	match = {
		class = "^(discord)$",
		title = "^(?![🔊🧊]).*$",
	},
})

-- Force regex match on any layer surface starting with swaync
hl.layer_rule({
	match = { namespace = "^swaync-.*" },
	blur = true,
	ignore_alpha = 0.5, -- Numeric value without quotes
})

hl.layer_rule({
	match = { namespace = "rofi" },
	blur = true,
	ignore_alpha = 0.5,
})

hl.window_rule({
	match = {
		class = "clipse-gui",
	},
	float = true,
	size = { 700, 600 },
	move = { "50%", 10 },
	pin = true,
})

-- CS2 Configuration
hl.window_rule({
	match = {
		class = ".*cs2.*|.*steam_app_730.*",
	},
	fullscreen = true,
	confine_pointer = true,
	opacity = 1.0,
	no_dim = true,
	no_blur = true,
	opaque = true,
})

-- Sea Of Thieves Configuration
hl.window_rule({
	match = {
		class = ".*sotgame.exe.*|.*steam_app_1172620.*",
	},
	fullscreen = true,
	confine_pointer = true,
	opacity = 1.0,
	no_dim = true,
	no_blur = true,
	opaque = true,
})

-- Minecraft Configuration
hl.window_rule({
	match = {
		class = ".*[Mm]inecraft.*",
	},
	fullscreen = true,
	confine_pointer = true,
	opacity = 1.0,
	no_dim = true,
	no_blur = true,
	opaque = true,
})
