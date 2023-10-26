local gamepassId = 178719514
local mps = game:GetService("MarketplaceService")
local soundEff1 = game.Workspace["UI Sound Effect"].buysucess1

game:GetService("MarketplaceService").PromptGamePassPurchaseFinished:Connect(function(plr, ido, purchased) --event when gamepass purchased
	if purchased and gamepassId == ido then --if this gamepass play SF and put gun in backpack
		soundEff1.Playing = true 
		script.HyperlaserGun:Clone().Parent = plr.Backpack
		script.HyperlaserGun:Clone().Parent = plr.StarterGear
	end
end)

--when a player with gamepass joins game/spawns (back) in, will put gun in backpack
game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if mps:UserOwnsGamePassAsync(player.UserId, gamepassId) then
			script.HyperlaserGun:Clone().Parent = player.Backpack
		end
	end)
end)


