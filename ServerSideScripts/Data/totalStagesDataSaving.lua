local DataStoreService = game:GetService("DataStoreService")
local DataStoreTotal = DataStoreService:GetDataStore("Total3") -- Old datastore is Total and Total2 (can't reset)
--new datastore is Total3

--when player added, if has data then change total stages to saved total stages
game.Players.PlayerAdded:Connect(function(player)
	local data
	local success, errorMessage = pcall(function()
		data = DataStoreTotal:GetAsync(player.UserId)
	end)
	if success then
		player.leaderstats.Total.Value = data
	else
		warn(errorMessage)
	end
end)

--when player leaves, store their total stages into datastore for later user
game.Players.PlayerRemoving:Connect(function(player)
	local data
	local success, errorMessage = pcall(function()
		data = DataStoreTotal:SetAsync(player.UserId, player.leaderstats.Total.Value)
	end)

	if success then
		print("Data Saved")
	else
		warn(errorMessage)
	end
end)

game:BindToClose(function()
	for i, v in pairs(game.Players:GetChildren()) do
		v:Kick("Server Closed")
	end

	wait(2)
end)

--each script can only save a certain data.
