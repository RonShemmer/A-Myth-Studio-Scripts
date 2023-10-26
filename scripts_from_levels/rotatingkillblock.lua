local part = script.Parent

part.Touched:Connect(function(touchPart)
	local humanoid = touchPart.Parent:FindFirstChild("Humanoid")
	if humanoid then
		humanoid.Health = 0
	end
end)

TweenService = game:GetService("TweenService")
spininfo = TweenInfo.new(7,Enum.EasingStyle.Linear)
--rotates block a certain angle in radians in the z direction using TweenService
Spin1 = TweenService:Create(script.Parent,spininfo,{CFrame = part.CFrame * CFrame.Angles(0,0,math.rad(120))})
Spin2 = TweenService:Create(script.Parent,spininfo,{CFrame = part.CFrame * CFrame.Angles(0,0,math.rad(240))})
Spin3 = TweenService:Create(script.Parent,spininfo,{CFrame = part.CFrame * CFrame.Angles(0,0,math.rad(360))})

Spin1:Play()
Spin1.Completed:Connect(function()Spin2:Play() end)
Spin2.Completed:Connect(function()Spin3:Play() end)
Spin3.Completed:Connect(function()Spin1:Play() end)
