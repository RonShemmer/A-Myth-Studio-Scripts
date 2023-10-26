script.Parent = game:GetService("ServerScriptService")
local PhysService = game:GetService("PhysicsService")
local PlayerGroup = PhysService:CreateCollisionGroup("p")
PhysService:CollisionGroupSetCollidable("p","p",false)

function NoCollide(model)
	for k,v in pairs (model:GetChildren()) do
		if v:IsA"BasePart" then
			PhysService:SetPartCollisionGroup(v,"p")

		end
	end
end

--removes collision between players
game:GetService("Players").PlayerAdded:connect(function(player)
	player.CharacterAdded:connect(function(char)
		char:WaitForChild("HumanoidRootPart")
		char:WaitForChild("Head")
		char:WaitForChild("Humanoid")
		wait(0.1)
		NoCollide(char)

		if player.Character then
			NoCollide(player.Character)
		end
	end)
end)
