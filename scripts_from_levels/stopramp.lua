local part = script.Parent
local function onTouch(otherPart)
	local humanoid = otherPart.Parent:FindFirstChild('Humanoid')
	-- resets player movement values
    if humanoid and humanoid.WalkSpeed > 16 and humanoid.JumpPower > 51 then
		humanoid.WalkSpeed -= 100
		humanoid.JumpPower -= 20
	end
end

part.Touched:Connect(onTouch)