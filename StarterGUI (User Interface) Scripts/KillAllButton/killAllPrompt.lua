local productId = 1593439656
local moneySound = game.Workspace["UI Sound Effect"].money

local mps = game:GetService("MarketplaceService")

script.Parent.TextButton.MouseButton1Click:Connect(function()
	moneySound.Playing = true
	mps:PromptProductPurchase(game.Players.LocalPlayer,productId)
	wait(moneySound.TimeLength)
	moneySound.Playing = false
end)