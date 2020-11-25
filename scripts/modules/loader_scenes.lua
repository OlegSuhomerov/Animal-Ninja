
local monarch = require('monarch.monarch')

local loader_scenes = {}

function loader_scenes.show_scene(scene_id)
	monarch.replace(scene_id)
end

return loader_scenes