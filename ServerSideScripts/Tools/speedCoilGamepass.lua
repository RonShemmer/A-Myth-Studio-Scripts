local gamepassId = 131757618
local mps = game:GetService("MarketplaceService")
local soundEff1 = game.Workspace["UI Sound Effect"].buysucess1

--if this gamepass purchased, play SF and put coil in backpack
game:GetService("MarketplaceService").PromptGamePassPurchaseFinished:Connect(function(plr, ido, purchased)
	if purchased and gamepassId == ido then
		soundEff1.Playing = true
		script.SpeedCoil:Clone().Parent = plr.Backpack
		script.SpeedCoil:Clone().Parent = plr.StarterGear
	end
end)

--when a player with gamepass joins game/spawns (back) in, will put coil in backpack
game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if mps:UserOwnsGamePassAsync(player.UserId, gamepassId) then
			script.SpeedCoil:Clone().Parent = player.Backpack
		end
	end)
end)


