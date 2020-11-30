
local game_components = require('scripts.start_modules.game_components')
local game_messages = require('scripts.start_modules.game_messages')
local config = require('scripts.start_modules.config')

local animate_button = {}

play_anim = false
function animate_button.animation(id, self, action_id, action)
	local node = gui.get_node(id)
	if action_id == game_messages.touch and gui.pick_node(node, action.x, action.y) then
		if play_anim == false then
			gui.animate(node, game_messages.scale, 0.8, gui.PLAYBACK_LOOP_FORWARD, 0.3)
			self.start_color = gui.get_color(node)
			local anim_color = self.start_color * config.blackout
			anim_color.w = 1
			gui.animate(node, game_messages.color, anim_color, gui.PLAYBACK_LOOP_FORWARD, 0.3)
			play_anim = true
		end
	end
	if action.released then
		gui.animate(node, game_messages.scale, 1, gui.PLAYBACK_LOOP_FORWARD, 0.3, 0, function()
			play_anim = false
		end)
		gui.animate(node, game_messages.color, self.start_color, gui.PLAYBACK_LOOP_FORWARD, 0.3)
	end
end
	
return animate_button