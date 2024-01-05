local button = script.Parent
_G.prizeVisible = false
local frame = button.Parent.PrizeFrame
local otherFrame = button.Parent.ShopFrame

-- frame.Size = UDim2.new(0.01,0,0.01,0)
frame.Position = UDim2.new(0.5,0,1.5,0)
frame.Visible = false

button.MouseButton1Down:Connect(function ()

	if not _G.prizeVisible and otherFrame.Visible == false then

		frame.Visible = true
		frame:TweenSizeAndPosition(UDim2.new(0.621, 0,0.731, 0),
			UDim2.new(0.496, 0,0.497, 0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Sine,
			.5,
			false)
		
		wait(.5)
		_G.prizeVisible = true
		
	elseif not _G.prizeVisible and otherFrame.Visible == true then 
		otherFrame:TweenSizeAndPosition(UDim2.new(0.01,0,0.01,0),
			UDim2.new(0.5,0,1.5,0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Sine,
			.5,
			false)
		wait(.5)
		otherFrame.Visible = false
		_G.shopVisible = false
		frame.Visible = true
		frame:TweenSizeAndPosition(UDim2.new(0.621, 0,0.731, 0),
			UDim2.new(0.496, 0,0.497, 0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Sine,
			.5,
			false)

		wait(.5)
		_G.prizeVisible = true
	else

		frame:TweenSizeAndPosition(UDim2.new(0.01,0,0.01,0),
			UDim2.new(0.5,0,1.5,0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Sine,
			.5,
			false)

		wait(.5)
		_G.prizeVisible = false
		frame.Visible = false

	end

end)