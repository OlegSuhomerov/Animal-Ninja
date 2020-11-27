
local defsave = require("defsave.defsave")
local gui_constants = require('scripts.start_modules.gui_constants')


local record = {}

defsave.appname = "Animal_Ninja"
defsave.load("save_config")

function record.check()
	
	if defsave.get("save_config","record_score") < gui_constants.score_in_popup then
		defsave.set("save_config", "record_score", gui_constants.score_in_popup)
		defsave.save("save_config")
		return true
	end
end

function record.show()
	return defsave.get("save_config","record_score")
end

return record