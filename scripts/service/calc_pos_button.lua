

local calc_pos_button = {}

function calc_pos_button.min(size_x, size_y, center)
	local pos_x = center.x - size_x / 2
	local pos_y = center.y - size_y / 2
	return vmath.vector3(pos_x, pos_y, 0)
end

function calc_pos_button.max(size_x, size_y, center)
	local pos_x = center.x + size_x / 2
	local pos_y = center.y + size_y / 2
	return vmath.vector3(pos_x, pos_y, 0)
end

return calc_pos_button