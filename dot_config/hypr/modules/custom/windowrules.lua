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

hl.window_rule({
	match = {
		class = "^(discord)$",
	},
	opacity = 1.0,
	no_dim = true,
	no_blur = true,
	opaque = true,
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
