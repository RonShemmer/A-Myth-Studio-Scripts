script.Parent.MouseButton1Down:Connect(function()
	local marketPlaceService = game:GetService("MarketplaceService")
	marketPlaceService:PromptGamePassPurchase(game.Players.LocalPlayer, 131753658)
end)