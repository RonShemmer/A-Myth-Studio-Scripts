local cushion = script.Parent
cushion.Transparency = 1
-- takes away additional jumping power from players upon interaction and sets value back to defualt jump power
cushion.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local humanoid = hit.Parent:FindFirstChild("Humanoid")
		humanoid.JumpHeight = 7.2
	end
end)