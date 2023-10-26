local DataStoreService = game:GetService("DataStoreService")
local DataStoreStage = DataStoreService:GetDataStore("Stage5") 
--Old DataStore is Stage, Stage2, Stage3, Stage 4 (can't reset)
--Current datastore is Stage5

--when player joins, if has data then change stage value to saved stage value
game.Players.PlayerAdded:Connect(function(player)
	local data
	local success, errorMessage = pcall(function()
		data = DataStoreStage:GetAsync(player.UserId)
	end)
	if success then
		player.leaderstats.Stage.Value = data
	else
		warn(errorMessage)
	end
end)

--when player leaves, put their current stage value into data store for later use
game.Players.PlayerRemoving:Connect(function(player)
	local data
	local success, errorMessage = pcall(function()
		data = DataStoreStage:SetAsync(player.UserId, player.leaderstats.Stage.Value)
	end)

	if success then
		print("Data Saved")
	else
		warn(errorMessage)
	end
end)

--each script can only save a certain data.

