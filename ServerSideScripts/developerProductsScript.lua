local marketPlaceService = game:GetService("MarketplaceService")

--when something is bought, processes the receipt and details
marketPlaceService.ProcessReceipt = function(receiptInfo)
	local player = game.Players:GetPlayerByUserId(receiptInfo.PlayerId)
	
    --skip stage product, will spawn player to next checkpoint
	if receiptInfo.ProductId == 1368446741 then
		player.leaderstats.Stage.Value += 1
		player.leaderstats.Total.Value += 1
		task.wait(1)
		local char = game.Workspace:FindFirstChild(player.Name)
		local checkpoint = game.Workspace.Checkpoints.Stages:FindFirstChild(player.leaderstats.Stage.Value)
		char:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(checkpoint.base.Position + Vector3.new(0,5,0), checkpoint.base.Position)
		char:FindFirstChild("HumanoidRootPart").Orientation = Vector3.new(0,0,0)
		return Enum.ProductPurchaseDecision.PurchaseGranted
		
    --skipping all stages product, will spawn player at last stage (total 300 stages)
	elseif receiptInfo.ProductId == 1594048655 then
		local lastStage = player.leaderstats.Stage.Value
		local stagesSkipped = 300 - lastStage
		player.leaderstats.Stage.Value = 300
		player.leaderstats.Total.Value += stagesSkipped
		task.wait(1)
		local char = game.Workspace:FindFirstChild(player.Name)
		local checkpoint = game.Workspace.Checkpoints.Stages:FindFirstChild(player.leaderstats.Stage.Value)
		char:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(checkpoint.base.Position + Vector3.new(0,5,0), checkpoint.base.Position)
		char:FindFirstChild("HumanoidRootPart").Orientation = Vector3.new(0,0,0)
		return Enum.ProductPurchaseDecision.PurchaseGranted
		
    --killing all players product, will kill all players besides one who bought the product
	elseif receiptInfo.ProductId == 1593439656 then
		local plr = game.Players:GetPlayerByUserId(receiptInfo.PlayerId)
		for _, player in pairs(game.Players:GetChildren()) do 
			if player.Name ~= plr.Name then
				player.Character.Humanoid.Health = 0
				game.ReplicatedStorage.KilledPlayer:FireClient(player,plr)
			end
		end

    --developer skip. used to skip to certain stages for testing
	elseif receiptInfo.ProductId == 1368996579 then
		player.leaderstats.Stage.Value = 0
		player.leaderstats.Total.Value = 0
		player.leaderstats.Prestige.Value = 0
		wait(1)
		player:LoadCharacter()
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
end