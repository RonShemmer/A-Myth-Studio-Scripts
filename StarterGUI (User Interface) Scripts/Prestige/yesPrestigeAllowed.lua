local player = game.Players.LocalPlayer
local leaderboard = player:WaitForChild("leaderstats")
local Checkpoints = workspace:WaitForChild("Checkpoints").Stages
local red = Color3.fromRGB(255, 0, 0)
local stages = 300
local remoteEvent = game.ReplicatedStorage.PrestigeRemoteEvent

script.Parent.MouseButton1Down:Connect(function()
	while stages > 0 do
		local stage = Checkpoints:WaitForChild(stages)
		local arrowhead = stage.arrowhead
		local arrowbody = stage.arrowbody
		local border = stage.border
		arrowhead.Color = red
		arrowbody.Color = red
		border.Color = red
		stages = stages - 1
	end
	remoteEvent:FireServer(player)
end)