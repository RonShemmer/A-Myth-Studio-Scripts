local gamepassId = 177713194
local mps = game:GetService("MarketplaceService")
local soundEff1 = game.Workspace["UI Sound Effect"].buysucess1 

game:GetService("MarketplaceService").PromptGamePassPurchaseFinished:Connect(function(plr, ido, purchased) --event when a gamepass is purchased
	if purchased and gamepassId == ido then --if gamepass matches this gamepass
		soundEff1.Playing = true --play sound effect
	end
end)

--assigning the player to Admin role is within a different script