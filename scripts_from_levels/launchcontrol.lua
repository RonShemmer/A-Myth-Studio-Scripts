script.Parent.Transparency = 1
script.Parent.Touched:Connect(function(HitPart)
	local Character = HitPart.Parent
	local Humanoid = Character:FindFirstChild("Humanoid")
	-- slows down launch and shifts direction of velocity
    if Humanoid ~= nil then
		Humanoid.Sit = true
		script.Parent.Velocity = Vector3.new(0, 10, 20)
	end
end)