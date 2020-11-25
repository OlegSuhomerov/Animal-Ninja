
local rendercam = require('rendercam.rendercam')
local game_messages = require('scripts.start_modules.game_messages')

local config = {}

-- Config
config.count_sprite = 13
config.start_scale = 0.7
config.arr_group_go = {2,3,3,4,4,5,6,7,8,9,10}
config.gravity = 8
config.pause_between_levels = 5
config.pause_in_sec = 4
config.respawn_time = 0.5
config.min_swipe_time = 0.05
config.min_swipe_distance = 50
config.count_hearts = 3
config.maximum_line_hearts = 5
config.start_pos_hearts = vmath.vector3(1076,590,0)
config.size_heart = vmath.vector3(60,53.0,0)
config.space_hearts_x = 90
config.space_hearts_y = 90
config.score_for_one = 100

--Color
config.brown = vmath.vector4(0.61, 0.27, 0, 1)
config.white = vmath.vector4(1, 1, 1, 1)
config.gray = vmath.vector4(0.5, 0.5, 0.5, 1)
config.yellow = vmath.vector4(1, 0.92, 0.016, 1)
config.pink = vmath.vector4(1, 0.6, 1, 1)

config.arr_colors_sprites = {
	config.brown, 
	config.white, 
	config.white, 
	config.gray, 
	config.gray, 
	config.yellow, 
	config.brown, 
	config.brown, 
	config.brown, 
	config.white, 
	config.pink, 
	config.gray, 
	config.yellow
}

config.param_start_animate = {
	{weight = 3, property =game_messages.euler_z, to = 360, duration = 2},
	{weight = 3, property =game_messages.euler_z, to = -360, duration = 2},
	{weight = 2, property = game_messages.scale, to = 0.1, duration = 6},
	{weight = 2, property = game_messages.scale, to = 1.4, duration = 10},
	{weight = 1, skip_animate = true},
}

config.arr_sprites = {
	{sprite = "bear", price = 120},
	{sprite = "cow", price = 80},
	{sprite = "chicken", price = 30},
	{sprite = "elephant", price = 130},
	{sprite = "wolf", price = 100},
	{sprite = "bird", price = 70},
	{sprite = "elk", price = 110},
	{sprite = "monkey", price = 90},
	{sprite = "goat", price = 50},
	{sprite = "panda", price = 150},
	{sprite = "pig", price = 60},
	{sprite = "rabbit", price = 40},
	{sprite = "giraffe", price = 140}
}

config.spawn_from_data = {
	{
		-- left-bottom angle
		weight = 4,
		start_pos = {min_x = 0, max_x = 1/3, min_y = 0, max_y = 0},
		starting_angle = {min = 45, max = 85},
		starting_speed = {min = 550, max = 750},
	},
	{
		--right-bottom angle
		weight = 4,
		start_pos = {min_x = 2/3, max_x = 1, min_y = 0, max_y = 0},
		starting_angle = {min = 95, max = 135},
		starting_speed = {min = 550, max = 750},
	},
	{
		--left edge
		weight = 2,
		start_pos = {min_x = 0, max_x = 0, min_y = 0.3, max_y = 0.7},
		starting_angle = {min = 0, max = 20},
		starting_speed = {min = 400, max = 800},
	},
	{
		--right edge
		weight = 2,
		start_pos = {min_x = 1, max_x = 1, min_y = 0.3, max_y = 0.7},
		starting_angle = {min = 160, max = 180},
		starting_speed = {min = 400, max = 800},
	},
	{
		--left-top angle
		weight = 1,
		start_pos = {min_x = 0, max_x = 0, min_y = 0.7, max_y = 0.95},
		starting_angle = {min = -15, max = 5},
		starting_speed = {min = 300, max = 800},
	},
	{
		--right-top angle
		weight = 1,
		start_pos = {min_x = 1, max_x = 1, min_y = 0.7, max_y = 0.9},
		starting_angle = {min = 175, max = 195},
		starting_speed = {min = 300, max = 800},
	},
}

config.arr_gui_hearts = {
	"heart_3",
	"heart_2",
	"heart_1"
}

config.arr_bg = {
	game_messages.falls,
	game_messages.forest,
	game_messages.lake,
	game_messages.mountains
}

return config