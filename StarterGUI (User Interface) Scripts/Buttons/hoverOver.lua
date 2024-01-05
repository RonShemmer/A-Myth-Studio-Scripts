--used for all buttons within this UI

script.Parent.MouseEnter:Connect(function()
	script.Parent.Size = UDim2.new(0.089, 0,0.152, 0)
end)
script.Parent.MouseLeave:Connect(function()
	script.Parent.Size = UDim2.new(0.082, 0,0.145, 0)
end)