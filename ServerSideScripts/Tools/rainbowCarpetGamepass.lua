local gamepassId = 131753032
local mps = game:GetService("MarketplaceService")
local soundEff1 = game.Workspace["UI Sound Effect"].buysucess1

--if purchased, plays SF and puts carpet in backpack
game:GetService("MarketplaceService").PromptGamePassPurchaseFinished:Connect(function(plr, ido, purchased)
	if purchased and gamepassId == ido then
		soundEff1.Playing = true
		script.FlyingCarpet:Clone().Parent = plr.Backpack
		script.FlyingCarpet:Clone().Parent = plr.StarterGear
	end
end)

--when a player with gamepass joins game/spawns (back) in, will put carpet in backpack
game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if mps:UserOwnsGamePassAsync(player.UserId, gamepassId) then
			script.FlyingCarpet:Clone().Parent = player.Backpack
		end
	end)
end)


