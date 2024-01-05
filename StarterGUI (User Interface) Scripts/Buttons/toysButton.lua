local button = script.Parent;
local TrailFrame = button.Parent.TrailsFrame
local MorphsFrame = button.Parent.MorphsFrame
local ToysFrame = button.Parent.ToysFrame

button.MouseButton1Down:Connect(function ()
	TrailFrame.Visible = false
	MorphsFrame.Visible = false
	ToysFrame.Visible = true
end)

