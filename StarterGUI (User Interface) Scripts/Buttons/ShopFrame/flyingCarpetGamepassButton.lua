local moneySound = game.Workspace["UI Sound Effect"].money

script.Parent.MouseButton1Click:Connect(function()
	moneySound.Playing = true
	wait(moneySound.TimeLength)
	moneySound.Playing = false
	local marketPlaceService = game:GetService("MarketplaceService")
	marketPlaceService:PromptGamePassPurchase(game.Players.LocalPlayer, 131753032)
end)
