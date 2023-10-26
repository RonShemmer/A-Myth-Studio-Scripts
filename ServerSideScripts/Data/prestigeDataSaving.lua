local DataStoreService = game:GetService("DataStoreService")
local DataStoreTotal = DataStoreService:GetDataStore("Prestige1") -- No old data stores

--when player added, get their data from the data store and change prestige to that value
game.Players.PlayerAdded:Connect(function(player)
	local data
	local success, errorMessage = pcall(function()
		data = DataStoreTotal:GetAsync(player.UserId)
	end)
	if success then
		player.leaderstats.Prestige.Value = data
	else
		warn(errorMessage)
	end
end)

--when player leaves, store their prestige into data store for later use
game.Players.PlayerRemoving:Connect(function(player)
	local data
	local success, errorMessage = pcall(function()
		data = DataStoreTotal:SetAsync(player.UserId, player.leaderstats.Prestige.Value)
	end)

	if success then
		print("Data Saved")
	else
		warn(errorMessage)
	end
end)

--each script can only save a certain data.
