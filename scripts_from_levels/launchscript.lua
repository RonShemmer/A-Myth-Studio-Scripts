local cannon = script.Parent
local touched = false

cannon.Touched:Connect(function(touch)

	local char = touch.Parent
    --checks for the player touching the object
	if game.Players:GetPlayerFromCharacter(char) and char:FindFirstChild("HumanoidRootPart") and touched == false and not char:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity") then
		char.HumanoidRootPart.CFrame = cannon.CFrame
		touched = true
		wait()
		local bodyVelocity = Instance.new("BodyVelocity")
        --sets the direction and magnitude of player velocity
		bodyVelocity.Velocity = Vector3.new(40,40,0)	
		bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bodyVelocity.P = math.huge

		bodyVelocity.Parent = char.HumanoidRootPart

		wait(1)

		touched = false
		bodyVelocity:Destroy()
	end
end)