local floors = workspace.Checkpoints:WaitForChild("Floors")
local stages = workspace.Checkpoints:WaitForChild("Stages")

local triggerBlocks = workspace.Checkpoints:WaitForChild("triggerBlocks")
local badgeService = game:GetService("BadgeService")

--once player added, add their leaderstats data with stages, total stages, and prestige
game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	
	local stage = Instance.new("IntValue")
	stage.Name = "Stage"
	stage.Value = 0
	stage.Parent = leaderstats
	
	local totalstage = Instance.new("IntValue")
	totalstage.Name = "Total"
	totalstage.Value = 0
	totalstage.Parent = leaderstats
	
	local prestige = Instance.new("IntValue")
	prestige.Name = "Prestige"
	prestige.Value = 0
	prestige.Parent = leaderstats
	
    --when character is added, move character to their current checkpoint
	player.CharacterAdded:Connect(function(char)		
		local hum = char:WaitForChild("Humanoid")
		wait()
		char:MoveTo(stages:WaitForChild(stage.Value).base.Position)
        --when character touches a checkpoint, increase stage and current checkpoint b y one
		hum.Touched:Connect(function(hit)
			if hit.Parent == triggerBlocks then
				if tonumber(hit.Name) == stage.Value + 1 then
					if hum.Health ~= 0 then
						stage.Value = stage.Value + 1
						totalstage.Value = totalstage.Value + 1
                        --awarding stage-valued badges
						if totalstage.Value == 300 then
							badgeService:AwardBadge(player.UserId, 2141841297)
							print("awarded finished badge")
							badgeService:AwardBadge(player.UserId, 2147949623)
							print("awarded floor 6 badge")
						end
						if totalstage.Value == 51 then 
							badgeService:AwardBadge(player.UserId, 2141837720)
							print("awarded floor 1 badge")
						end
						if totalstage.Value == 101 then
							badgeService:AwardBadge(player.UserId, 2141837764)
							print("awarded floor 2 badge")
						end
						if totalstage.Value == 151 then
							badgeService:AwardBadge(player.UserId, 2141837770)
							print("awarded floor 3 badge")
						end
						if totalstage.Value == 201 then
							badgeService:AwardBadge(player.UserId, 2147687454)
							print("awarded floor 4 badge")
						end
						if totalstage.Value == 251 then
							badgeService:AwardBadge(player.UserId, 2147949321)
							print("awarded floor 5 badge")
						end
					end
				end
			end
		end)
	end)
end)
