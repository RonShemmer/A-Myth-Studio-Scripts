local gamepassId = 131753658
local mps = game:GetService("MarketplaceService")
local soundEff1 = game.Workspace["UI Sound Effect"].buysucess1

game:GetService("MarketplaceService").PromptGamePassPurchaseFinished:Connect(function(plr, ido, purchased) --event when gamepass purchased
	if purchased and gamepassId == ido then --if matches this gamepass
		soundEff1.Playing = true --play SF
		script.GravityCoil:Clone().Parent = plr.Backpack 
		script.GravityCoil:Clone().Parent = plr.StarterGear --put coil in backpack
	end
end)

--when a player with gamepass joins game/spawns (back) in, will put coil in backpack
game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if mps:UserOwnsGamePassAsync(player.UserId, gamepassId) then
			script.GravityCoil:Clone().Parent = player.Backpack
		end
	end)
end)