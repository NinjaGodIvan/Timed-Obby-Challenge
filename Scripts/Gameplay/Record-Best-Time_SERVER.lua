ReplicatedStorage = game.ReplicatedStorage

--[[Records player's best time

	Param(s):
	player => player object
	timer => best time in seconds
	
	Return(s):
	true => player beats their PR (setting best time)
	false => player did not beat their 
	prev stage => previous stage number
]]
ReplicatedStorage:FindFirstChild('Record Best Time').OnServerInvoke = function(player, timer)
	--Gets player's stages
	local playerStages = player:FindFirstChild('Stages')
	--Gets the player's previous stage number from player stages
	local prevStage = playerStages[tostring(player['Current Stage'].Value-1)]
	
	if timer < prevStage['Best Time'].Value then
		prevStage['Best Time'].Value = timer
		print(player.Name.."'s new best time ("..timer.." secs) on Stage "..prevStage.Name)
		return true, prevStage.Name
	end
	
	return false
end