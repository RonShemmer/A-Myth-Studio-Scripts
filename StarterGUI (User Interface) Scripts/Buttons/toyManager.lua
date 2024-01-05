local PrizeFrame =script.Parent

local ToysFrame = PrizeFrame.ToysFrame
local Template = PrizeFrame.ToysTemplate
--[[]]--
local ToyList=require(game.ReplicatedStorage:WaitForChild('ToyList'))
--[[]]--
local Player=game.Players.LocalPlayer
local leaderboard = Player:WaitForChild("leaderstats")
local TweenService=game:GetService('TweenService')
local Info=TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0)

local function OnActivation(Clone,b)
	ToysFrame.Selected.PriceBar.TextLabel.Text=b['Price']
	ToysFrame.Selected.ImageLabel.Image=b['Image']
	ToysFrame.Selected.TextLabel.Text=b['Name']

end
local function CreateToys()
	local Debounce=false
	for a, b in pairs(ToyList) do 
		local Name=b['Name']
		local Price=b['Price']
		local Image=b['Image']
		--[[]]--
		local Clone=Template:Clone()
		Clone.Frame.ImageLabel.Image=Image
		Clone.Frame.TextLabel.Text=Name
		Clone.LayoutOrder=a
		Clone.Parent=ToysFrame.ScrollingFrame
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
CreateToys()
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
		local Open=ToysFrame.Visible
		script['Toggle']:Play()
		if Open then
			ToysFrame.Visible=false
			ToysFrame.Position=UDim2.new(0.5,0,.45,0)
		else
			ToysFrame.Visible=true
			TweenService:Create(ToysFrame,Info,{Position=UDim2.new(0.5,0,0.5,0)}):Play()
		end
		task.wait(0.2) Debounce=false
	end)
end
SetOpenClose()

ToysFrame.Selected.TextLabel.Changed:Connect(function()
	if (ToysFrame.Selected.TextLabel.Text ~= "Select Toys") then
		local selectedToy = ToysFrame.Selected.TextLabel.Text
		local price = tonumber(ToysFrame.Selected.PriceBar.TextLabel.Text)
		if (leaderboard.Total.Value >= price) then
			ToysFrame.Selected.TextButton.Frame.TextLabel.Text = "Owned"
			ToysFrame.Selected.TextButton.Frame.BackgroundColor3=Color3.fromRGB(114, 255, 48)
			ToysFrame.Selected.TextButton.BackgroundColor3=Color3.fromRGB(54, 204, 0)
			ToysFrame.Selected.TextButton.Frame.TextLabel.UIStroke.Color = Color3.fromRGB(54, 204, 0)
		else
			ToysFrame.Selected.TextButton.Frame.TextLabel.Text = "Not Owned"
			ToysFrame.Selected.TextButton.Frame.BackgroundColor3=Color3.fromRGB(255, 76, 79)
			ToysFrame.Selected.TextButton.BackgroundColor3=Color3.fromRGB(208, 62, 67)
			ToysFrame.Selected.TextButton.Frame.TextLabel.UIStroke.Color = Color3.fromRGB(208, 62, 67)
		end
	end
end)