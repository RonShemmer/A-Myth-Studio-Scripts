local player = game.Players.LocalPlayer
local leaderboard = player:WaitForChild("leaderstats")
local Checkpoints = workspace:WaitForChild("Checkpoints").Stages
local green = Color3.fromRGB(0, 255, 0)
local bool = true

leaderboard.Stage.Changed:Connect(function(val)
	print(val)
	if bool then
		local maxStages = val
		if maxStages > 0 then 
			local currentStages = 1
			while currentStages <= maxStages do
				local stage = Checkpoints:WaitForChild(currentStages)
				local arrowhead = stage.arrowhead
				local arrowbody = stage.arrowbody
				local border = stage.border
				arrowhead.Color = green
				arrowbody.Color = green
				border.Color = green
				currentStages = currentStages + 1
			end
		end
	end
	bool = false 
end)
