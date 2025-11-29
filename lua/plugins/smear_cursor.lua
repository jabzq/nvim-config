return {
	"sphamba/smear-cursor.nvim",
	opts = {
		cursor_color = "#d3cdc3",
		stiffness = 0.5,
		trailing_stiffness = 0.5,
		stiffness_insert_mode = 0.4,
		trailing_stiffness_insert_mode = 0.7,
		damping = 0.95,
		damping_insert_mode = 0.95,
		distance_stop_animating = 0.5,

		smear_between_buffers = true,
		smear_between_neighbor_lines = true,
		scroll_buffer_space = true,
		legacy_computing_symbols_support = false,
		smear_insert_mode = true,
	},
}
