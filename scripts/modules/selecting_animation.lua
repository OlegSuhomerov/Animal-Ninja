
local config = require('scripts.start_modules.config')
local game_messages = require('scripts.start_modules.game_messages')
local random_sampling = require('scripts.service.random_sampling')
local game_components = require('scripts.start_modules.game_components')

local selecting_animation = {}

function selecting_animation.random_sprite(self)


	self.num_rand_sprite = random_sampling.based_weights(config.arr_sprites)
	
	msg.post(game_components.sprite_go,game_messages.play_animation, {id = hash(config.arr_sprites[self.num_rand_sprite].sprite)})

end

function selecting_animation.random_animation(self)
	local anim_param = config.param_start_animate
	
	local i = random_sampling.based_weights(anim_param)
	if not anim_param[i].skip_animate then
		go.animate(".", anim_param[i].property, go.PLAYBACK_LOOP_FORWARD, anim_param[i].to,go.EASING_LINEAR, anim_param[i].duration)
	end
end

return selecting_animation