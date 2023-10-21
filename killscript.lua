local KillBrick = script.Parent

KillBrick.Touched:Connect((function(touchPart)

	local humanoid = touchPart.Parent:FindFirstChild("Humanoid")
	if humanoid then
		humanoid.Health = 0
	end

end))
