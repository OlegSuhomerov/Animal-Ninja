
local game_messages = require('scripts.start_modules.game_messages')
local game_components = require('scripts.start_modules.game_components')
local config = require('scripts.start_modules.config')

local spawn_particles = {}

function spawn_particles.bubles(self)
	particlefx.play(game_components.crumbs)
	particlefx.set_constant(game_components.crumbs, game_messages.emitter, game_messages.tint, config.arr_colors_sprites[self.num_rand_sprite])
end

return spawn_particles