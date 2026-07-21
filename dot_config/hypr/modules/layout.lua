-- Colors
local colors = require("colors.colors-matugen")

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,

		border_size = 2,

		col = {
			active_border = { colors = { colors.primary, colors.secondary }, angle = 45 },
			inactive_border = colors.inactive,
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		allow_tearing = false,

		layout = "scrolling",
	},

	decoration = {
		rounding = 7,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
	},

	animations = {
		enabled = true,
	},
})

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	decoration = {
		rounding = 10,
		active_opacity = 0.90,
		inactive_opacity = 0.80,

		blur = {
			enabled = true,
			size = 3,
			passes = 3,
			new_optimizations = true,
			ignore_opacity = true,
			brightness = 1,
			contrast = 0.85,
			vibrancy = 0.1,
			noise = 0.01,
		},
	},
})
