local config = require('scripts.start_modules.config')
local game_messages = require('scripts.start_modules.game_messages')
local game_components = require('scripts.start_modules.game_components')


local deleting_object = {}

function deleting_object.frame_check(self)
	local space_x = self.sprite_size.x
	local space_y = self.sprite_size.y

	if self.pos.y < config.bottom_border - space_y
	or self.pos.x < config.left_border - space_x
	or self.pos.x > config.right_border + space_x 
	then
		go.delete()
		msg.post(game_components.gui, game_messages.reduce_lives)
	end
end


return deleting_object