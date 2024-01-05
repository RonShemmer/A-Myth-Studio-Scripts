script.Parent.MouseButton1Down:Connect(function()
	script.Parent.Parent:TweenSizeAndPosition(UDim2.new(0.01,0,0.01,0),
		UDim2.new(0.5,0,1.5,0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Sine,
		.5,
		false)
	wait(.5)
	script.Parent.Parent.Visible = false
end)