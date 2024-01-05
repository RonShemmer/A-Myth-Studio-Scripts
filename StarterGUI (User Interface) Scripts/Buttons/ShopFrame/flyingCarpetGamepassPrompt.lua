script.Parent.MouseButton1Click:Connect(function()
	local marketPlaceService = game:GetService("MarketplaceService")
	marketPlaceService:PromptGamePassPurchase(game.Players.LocalPlayer, 131753032)
end)