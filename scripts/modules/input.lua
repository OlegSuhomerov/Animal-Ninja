
local config = require('scripts.start_modules.config')
local game_messages = require('scripts.start_modules.game_messages')
local game_components = require('scripts.start_modules.game_components')
local rendercam = require('rendercam.rendercam')
local spawn_particles = require('scripts.modules.spawn_particles')

local input = {}

local action_pos = vmath.vector3()
local start_pos = vmath.vector3()
local end_pos = vmath.vector3()
local start_time = 0

local function is_colliding(arr)
	return arr.max.x >= action_pos.x and
	arr.max.y >= action_pos.y and
	arr.min.x <= action_pos.x and
	arr.min.y <= action_pos.y
end


function input.swipe(self, action_id, action)

	if action_id == game_messages.touch then

		action_pos = rendercam.screen_to_world_2d(action.screen_x, action.screen_y, false)

		local go_scale = go.get_scale()

		local arr_pos_go = {
			max = {x = self.pos.x + self.sprite_size.x * go_scale.x, y = self.pos.y + self.sprite_size.y * go_scale.y},
			min = {x = self.pos.x - self.sprite_size.x * go_scale.x, y = self.pos.y - self.sprite_size.y * go_scale.y},
		}

		if action.pressed then
			start_pos = action_pos
			start_time = socket.gettime()
		end

		if is_colliding(arr_pos_go) then

			end_pos = action_pos
			
			local length_x = math.pow(end_pos.x - start_pos.x, 2)
			local length_y = math.pow(end_pos.y - start_pos.y, 2)
			local length_swipe = math.sqrt(length_x + length_y)
			
			if socket.gettime() - start_time >= config.min_swipe_time
			and length_swipe >= config.min_swipe_distance then

				go.delete()
				spawn_particles.bubles(self)
				
				if config.arr_sprites[self.num_rand_sprite].bomb then
					msg.post(game_components.gui, game_messages.reduce_lives)
					return
				end

				if config.arr_sprites[self.num_rand_sprite].bonus then
					msg.post(game_components.gui, game_messages.add_heart)
					return
				end
				
				msg.post(game_components.gui, game_messages.change_score, {num_sprite = self.num_rand_sprite, death_pos = self.pos})
			end
		end
	end
end

return input