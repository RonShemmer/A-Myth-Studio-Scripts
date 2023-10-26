while wait() do
    -- transitions the beam to become invisible
	for number = 1, 100 do
		script.Parent.Transparency = (number * .01)
		task.wait()
	end
	task.wait(3)
    -- reverses invisibility
	for number = 1, 100 do
		script.Parent.Transparency = (1 - number * .01)
		task.wait()
		local KillBrick = script.Parent
		KillBrick.Touched:Connect(function(touchPart)
			humanoid = touchPart.Parent:FindFirstChild("Humanoid")
			if humanoid and (script.Parent.Transparency > 0.2) then
				humanoid.Health = 100
			end
		end)
	end
	task.wait(3)
    -- checks for player interaction after beam is no longer invisibile
	local KillBrick = script.Parent
	KillBrick.Touched:Connect(function(touchPart)
		humanoid = touchPart.Parent:FindFirstChild("Humanoid")
		if humanoid and (script.Parent.Transparency < 0.8) then
			humanoid.Health = 0
		end
	end)
end