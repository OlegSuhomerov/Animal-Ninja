
local random_sampling = {}


function random_sampling.based_weights(arr)

	local sum_weight = 0

	for i in pairs(arr) do
		sum_weight = sum_weight + arr[i].weight
	end	

	local random_number_weight = math.random(sum_weight)

	for i in pairs(arr) do
		if random_number_weight <= arr[i].weight then
			return i
		else
			random_number_weight = random_number_weight - arr[i].weight
		end
	end	
end

return random_sampling