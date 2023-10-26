local gamepassId = 178375546
local mps = game:GetService("MarketplaceService")
local soundEff1 = game.Workspace["UI Sound Effect"].buysucess1

--if gamepass purchased, play SF and put sword in backpack
game:GetService("MarketplaceService").PromptGamePassPurchaseFinished:Connect(function(plr, ido, purchased)
	if purchased and gamepassId == ido then
		soundEff1.Playing = true
		script.ClassicSword:Clone().Parent = plr.Backpack
		script.ClassicSword:Clone().Parent = plr.StarterGear
	end
end)

--when a player with gamepass joins game/spawns (back) in, will put sword in backpack
game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if mps:UserOwnsGamePassAsync(player.UserId, gamepassId) then
			script.ClassicSword:Clone().Parent = player.Backpack
		end
	end)
end)