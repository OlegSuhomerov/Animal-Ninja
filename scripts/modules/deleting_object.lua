local config = require('scripts.start_modules.config')
local game_messages = require('scripts.start_modules.game_messages')
local game_components = require('scripts.start_modules.game_components')
local rendercam = require('rendercam.rendercam')


local deleting_object = {}

function deleting_object.frame_check(self)
	local left_bootom_angle = rendercam.screen_to_world_2d(0, 0, false)
	local right_top_angle = rendercam.screen_to_world_2d(rendercam.window.x, rendercam.window.y, false)
	local space_x = self.sprite_size.x
	local space_y = self.sprite_size.y

	if self.pos.y < left_bootom_angle.y - space_y
	or self.pos.x < left_bootom_angle.x - space_x
	or self.pos.x > right_top_angle.x + space_x 
	then
		go.delete()
		
		if config.arr_sprites[self.num_rand_sprite].bomb then
			return
		end
		
		msg.post(game_components.gui, game_messages.reduce_lives)
	end
end


return deleting_object