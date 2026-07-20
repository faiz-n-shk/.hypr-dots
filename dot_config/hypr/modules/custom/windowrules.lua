-- Force pavucontrol to behave like a centered, floating menu
hl.window_rule({
	match = {
		class = ".*pavucontrol.*",
	},
	float = true,
	size = "700 600",
	move = "50% 10", -- modify to waybar's height
	pin = true,
})

-- 1. Strip ALL decorations ONLY when you are inside a voice channel / live stream
hl.window_rule({
	match = {
		class = "^(discord)$",
		title = "^🔊.*$", -- Matches ANY title that starts with the speaker icon
	},
	opacity = "1.0 override", -- "override" forces absolute opacity, bypassing global layers
	no_dim = true,
	no_blur = true,
	opaque = true,
})

-- 2. Standard Discord behavior when NOT in a voice channel
hl.window_rule({
	match = {
		class = "^(discord)$",
		title = "negative:^🔊.*$", -- Triggers only when the title does NOT start with the speaker icon
	},
	-- Leaves opacity blank so your global hl.config (0.90 / 0.80) naturally takes over
})

-- Force regex match on any layer surface starting with swaync
hl.layer_rule({
	match = { namespace = "^swaync-.*" },
	blur = true,
	ignore_alpha = 0.5,
})

-- Sea Of Theives Steam steam_app_1172620
-- Target Sea of Thieves to use immediate rendering (tearing) to unlock FPS
hl.window_rule({
	match = {
		class = "^steam_app_1172620$",
	},
	immediate = true,
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
	size = "700 600",
	move = "50% 10", -- modify to waybar's height
	pin = true,
})
