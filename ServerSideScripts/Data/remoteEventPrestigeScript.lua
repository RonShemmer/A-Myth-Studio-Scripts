--when player clicks prestige button and triggers a remote event
local remoteEvent = game.ReplicatedStorage.PrestigeRemoteEvent

--reset player's current stages and increase prestige by 1
remoteEvent.OnServerEvent:Connect(function(player)
	local leaderboard = player:WaitForChild("leaderstats")
	leaderboard.Stage.Value = 0
	leaderboard.Prestige.Value = leaderboard.Prestige.Value + 1
	task.wait(1)
	player:LoadCharacter()
end)
