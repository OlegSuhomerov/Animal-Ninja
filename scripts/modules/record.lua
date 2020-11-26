
local defsave = require("defsave.defsave")
local record_config = require('scripts.start_modules.record_config')
local gui_constants = require('scripts.start_modules.gui_constants')

local record = {}

defsave.appname = "Animal_Ninja"

function record.check()
	if gui_constants.score_in_popup > record_config.record then
		record_config.record = gui_constants.score_in_popup
		defsave.save("scripts/start_modules/record_config")
		pprint(defsave.get("record_config"))
	end
end

return record