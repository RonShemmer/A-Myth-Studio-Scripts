local player = game.Players.LocalPlayer
local leaderboard = player:WaitForChild("leaderstats")
local Checkpoints = workspace:WaitForChild("Checkpoints").Stages
local green = Color3.fromRGB(0, 255, 0)
local gamepass = game.Workspace.newCheckpoints.gamepass220
local stage = 220
local border1 = gamepass.border1
local border2 = gamepass.border2

leaderboard.Stage.Changed:Connect(function(val)
	if val == stage then
		border1.Color = green
		border2.Color = green
	end
end)

