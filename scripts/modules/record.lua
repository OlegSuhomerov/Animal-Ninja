
local defsave = require("defsave.defsave")
local gui_constants = require('scripts.start_modules.gui_constants')


local record = {}



function record.load_save()
	
	defsave.appname = "Animal_Ninja"
	defsave.load("save_config")
	
	if defsave.get("save_config","record_score") == nil then
		defsave.set("save_config", "record_score", 0)
		return 0
	end
end

function record.check()
	record.load_save()
	
	if defsave.get("save_config","record_score") < gui_constants.score_in_popup then
		defsave.set("save_config", "record_score", gui_constants.score_in_popup)
		defsave.save("save_config")
		return true
	end
end

function record.show()
	record.load_save()
	return defsave.get("save_config","record_score")
end

return record