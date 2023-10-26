local part = script.Parent

-- tween to control the movement transitions
TweenService = game:GetService("TweenService")
spininfo = TweenInfo.new(4,Enum.EasingStyle.Linear)
-- adjust x y z values to rotate block in desired orientation
Spin1 = TweenService:Create(script.Parent,spininfo,{CFrame = part.CFrame * CFrame.Angles(0,0,math.rad(120))})
Spin2 = TweenService:Create(script.Parent,spininfo,{CFrame = part.CFrame * CFrame.Angles(0,0,math.rad(240))})
Spin3 = TweenService:Create(script.Parent,spininfo,{CFrame = part.CFrame * CFrame.Angles(0,0,math.rad(360))})

Spin1:Play()
Spin1.Completed:Connect(function()Spin2:Play() end)
Spin2.Completed:Connect(function()Spin3:Play() end)
Spin3.Completed:Connect(function()Spin1:Play() end)
