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

-- Force regex match on any layer surface starting with swaync
hl.layer_rule({
	match = { namespace = "^swaync-.*" },
	blur = true,
	ignore_alpha = 0.5,
})

-- Target Sea of Thieves to use immediate rendering (tearing) to unlock FPS
hl.window_rule({
	match = {
		class = "^steam_app_1172620$",
	},
	immediate = true,
})

-- Enable tearing master switch inside the general table
hl.config({
	general = {
		allow_tearing = true,
	},
})
