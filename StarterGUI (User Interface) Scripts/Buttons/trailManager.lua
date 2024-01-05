local PrizeFrame =script.Parent

local TrailsFrame = PrizeFrame.TrailsFrame
local Template = PrizeFrame.TrailsTemplate
--[[]]--
local TrailList=require(game.ReplicatedStorage:WaitForChild('TrailList'))
--[[]]--
local Player=game.Players.LocalPlayer
local TweenService=game:GetService('TweenService')
local Info=TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0)
--[[]]--
local function VisualUnequip(TextButton)
	TextButton.Frame.BackgroundColor3=Color3.fromRGB(255, 76, 79)
	TextButton.BackgroundColor3=Color3.fromRGB(208, 62, 67)
	TextButton.Frame.TextLabel.UIStroke.Color = Color3.fromRGB(208, 62, 67)
	TextButton.Frame.TextLabel.Text="Unequip"
end
local function VisualEquip(TextButton)
	TextButton.Frame.BackgroundColor3=Color3.fromRGB(114, 255, 48)
	TextButton.BackgroundColor3=Color3.fromRGB(54, 204, 0)
	TextButton.Frame.TextLabel.UIStroke.Color = Color3.fromRGB(54, 204, 0)
	TextButton.Frame.TextLabel.Text="Equip"
end
local function OnActivation(Clone,b)
	TrailsFrame.Selected.PriceBar.TextLabel.Text=b['Price']
	TrailsFrame.Selected.ImageLabel.Image=b['Image']
	TrailsFrame.Selected.TextLabel.Text=b['Name']
	if Player.OwnedTrails:FindFirstChild(b['Name']) then
		if Player.EquippedTrail.Value==b['Name'] then
			VisualUnequip(TrailsFrame.Selected.TextButton)
		else VisualEquip(TrailsFrame.Selected.TextButton)
		end
	else
		TrailsFrame.Selected.TextButton.Frame.BackgroundColor3=Color3.fromRGB(114, 255, 48)
		TrailsFrame.Selected.TextButton.BackgroundColor3=Color3.fromRGB(54, 204, 0)
		TrailsFrame.Selected.TextButton.Frame.TextLabel.UIStroke.Color = Color3.fromRGB(54, 204, 0)
		TrailsFrame.Selected.TextButton.Frame.TextLabel.Text="Buy"
	end
end
local function CreateTrails()
	local Debounce=false
	for a, b in pairs(TrailList) do 
		local Name=b['Name']
		local Price=b['Price']
		local Image=b['Image']
		--[[]]--
		local Clone=Template:Clone()
		Clone.Frame.ImageLabel.Image=Image
		Clone.Frame.TextLabel.Text=Name
		Clone.LayoutOrder=a
		Clone.Parent=TrailsFrame.ScrollingFrame
		Clone.Visible=true
		Clone.Name=Name
		--[[]]--
		Clone.Frame.Activated:Connect(function()
			if Debounce==true then return end
			Debounce=true
			OnActivation(Clone,b)
			task.wait(0.2) Debounce=false
		end)
		Clone.Frame.MouseEnter:Connect(function()
			TweenService:Create(Clone.Frame,Info,{Size=UDim2.new(.975,0,.975,0)}):Play()
		end)
		Clone.Frame.MouseLeave:Connect(function()
			TweenService:Create(Clone.Frame,Info,{Size=UDim2.new(.95,0,.95,0)}):Play()
		end)
	end
end
CreateTrails()
local function SetOpenClose()
	local Toggle= PrizeFrame.Toggle
	local Debounce=false
	Toggle.MouseEnter:Connect(function()
		TweenService:Create(Toggle,Info,{Size=UDim2.new(0.141,0,0.08,0)}):Play()
	end)
	Toggle.MouseLeave:Connect(function()
		TweenService:Create(Toggle,Info,{Size=UDim2.new(0.133,0,0.077,0)}):Play()
	end)
	--[[]]--
	Toggle.Activated:Connect(function()
		if Debounce==true then return end
		Debounce=true
		local Open=TrailsFrame.Visible
		script['Toggle']:Play()
		if Open then
			TrailsFrame.Visible=false
			TrailsFrame.Position=UDim2.new(0.5,0,.45,0)
		else
			TrailsFrame.Visible=true
			TweenService:Create(TrailsFrame,Info,{Position=UDim2.new(0.5,0,0.5,0)}):Play()
		end
		task.wait(0.2) Debounce=false
	end)
end
SetOpenClose()
--[[]]--
local ResponseDebounce=false
TrailsFrame.Selected.TextButton.Activated:Connect(function()
	if ResponseDebounce==true then return end
	ResponseDebounce=true
	local Functions={
		['Equip']=function()
			--[[Successfully Equipped]]--
			VisualUnequip(TrailsFrame.Selected.TextButton)
			
			--Red around the frame
		end,	
		['Unequip']=function()
			--[[Successfully Unequipped]]--
			VisualEquip(TrailsFrame.Selected.TextButton)
		end,
		['Buy']=function()
			--[[Successfully Bought]]--
			TrailsFrame.Selected.TextButton.Frame.BackgroundColor3=Color3.fromRGB(114, 255, 48)
			TrailsFrame.Selected.TextButton.BackgroundColor3=Color3.fromRGB(54, 204, 0)
			TrailsFrame.Selected.TextButton.Frame.TextLabel.UIStroke.Color = Color3.fromRGB(54, 204, 0)
			TrailsFrame.Selected.TextButton.Frame.TextLabel.Text="Equip"
		end,
	}
	local Response=game.ReplicatedStorage.TrailResponse:InvokeServer(
		TrailsFrame.Selected.TextLabel.Text,
		TrailsFrame.Selected.TextButton.Frame.TextLabel.Text
	)
	if Response then Functions[TrailsFrame.Selected.TextButton.Frame.TextLabel.Text]() end
	task.wait(0.2) ResponseDebounce=false
end)