local moneySound = game.Workspace["UI Sound Effect"].money

script.Parent.MouseButton1Click:Connect(function()
	moneySound.Playing = true
	local marketPlaceService = game:GetService("MarketplaceService")
	marketPlaceService:PromptProductPurchase(game.Players.LocalPlayer, 1594048655)
	wait(moneySound.TimeLength)
	moneySound.Playing = false
end)