--giving toys to players at certain levels

--all the toys
local bloxyColaPrice = script['ToyStorage'].BloxyCola.Price.Value
local chocolateMilkPrice = script['ToyStorage']["Chocolate Milk"].Price.Value
local gravityCoilPrice = script['ToyStorage']["Gravity Coil"].Price.Value
local iceCreamPrice = script['ToyStorage']["Ice Cream"].Price.Value
local jetpackPrice = script['ToyStorage'].Jetpack.Price.Value
local pizzaPrice = script.ToyStorage.Pizza.Price.Value
local speedCoilPrice = script.ToyStorage["Speed Coil"].Price.Value
local sprayPaintPrice = script.ToyStorage["Spray Paint"].Price.Value
local teddyBearPrice = script.ToyStorage["Teddy Bear"].Price.Value
local invisibilityCloakPrice = script.ToyStorage["InvisibilityCloak"].Price.Value

--lets player have toy even when they die
--when player added
game.Players.PlayerAdded:Connect(function(Player)
	local firstJoined = true
	--when character added
	Player.CharacterAdded:Connect(function()
		local leaderboard = Player:WaitForChild("leaderstats")
		if(leaderboard.Stage.Value == 0) then
			task.wait(2)
		end
		--conditional to see if they own any of the toys
		local stage = leaderboard:WaitForChild("Total").Value
		local ToyStorage = script.ToyStorage
		if (iceCreamPrice <= stage) then
			ToyStorage["Ice Cream"]:Clone().Parent = Player.Backpack
			if (teddyBearPrice <= stage) then
				ToyStorage["Teddy Bear"]:Clone().Parent = Player.Backpack
				if (pizzaPrice <= stage) then
					ToyStorage.Pizza:Clone().Parent = Player.Backpack
					if (chocolateMilkPrice <= stage) then
						ToyStorage["Chocolate Milk"]:Clone().Parent = Player.Backpack
						if (bloxyColaPrice <= stage) then
							ToyStorage.BloxyCola:Clone().Parent = Player.Backpack
							if (sprayPaintPrice <= stage) then 
								ToyStorage["Spray Paint"]:Clone().Parent = Player.Backpack
								if (speedCoilPrice <= stage) then 
									ToyStorage["Speed Coil"]:Clone().Parent = Player.Backpack
									if (gravityCoilPrice <= stage) then
										ToyStorage["Gravity Coil"]:Clone().Parent = Player.Backpack
										if (jetpackPrice <= stage) then 
											ToyStorage.Jetpack:Clone().Parent = Player.Backpack
											if (invisibilityCloakPrice <= stage) then 
												ToyStorage.InvisibilityCloak:Clone().Parent = Player.Backpack
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
		firstJoined = false
	end)
	
	--when stage value changes, check to see if player gets a toy. if so, equip them the toy.
	local leaderboard = Player:WaitForChild("leaderstats")
	leaderboard.Total.Changed:Connect(function(val)
		if not firstJoined then 
			local stage = leaderboard.Total.Value
			local ToyStorage = script.ToyStorage
			if (stage == 5) then
				ToyStorage["Ice Cream"]:Clone().Parent = Player.Backpack
			end
			if (stage == 20) then
				ToyStorage["Teddy Bear"]:Clone().Parent = Player.Backpack
			end
			if (stage == 40) then
				ToyStorage.Pizza:Clone().Parent = Player.Backpack
			end
			if (stage == 70) then
				ToyStorage["Chocolate Milk"]:Clone().Parent = Player.Backpack
			end
			if (stage == 100) then
				ToyStorage.BloxyCola:Clone().Parent = Player.Backpack
			end
			if (stage == 150) then
				ToyStorage["Spray Paint"]:Clone().Parent = Player.Backpack
			end
			if (stage == 200) then
				ToyStorage["Speed Coil"]:Clone().Parent = Player.Backpack
			end
			if (stage == 250) then
				ToyStorage["Gravity Coil"]:Clone().Parent = Player.Backpack
			end
			if (stage == 301) then
				ToyStorage.Jetpack:Clone().Parent = Player.Backpack
			end
			if (stage == 349) then
				ToyStorage.InvisibilityCloak:Clone().Parent = Player.Backpack
			end
		end
	end)
end)

