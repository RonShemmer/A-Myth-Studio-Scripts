local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Checkpoints = workspace:WaitForChild("Checkpoints").Stages
local player = game.Players.LocalPlayer
local leaderboard = player:WaitForChild("leaderstats")
local arrow = Assets.Arrow:Clone()
local t = 0
local moving = false
local current_pos = Checkpoints['1'].base.CFrame * CFrame.new(0,9,0) * CFrame.Angles(0,math.rad(90),math.rad(-90))
local maxStages = 300
local frame = script.Parent.Parent
local indicator = script.Parent.Parent.Indicator

local uiGradient = script.Parent

local green = Color3.fromRGB(0, 255, 0)
local lightBlue = Color3.fromRGB(105, 223, 249)
local white = Color3.fromRGB(255,255,255)

--local colSequence = ColorSequence.new{
--	ColorSequenceKeypoint.new(0, green),
--	ColorSequenceKeypoint.new(0.00862068965, green),
--	ColorSequenceKeypoint.new(0.00872068965, white),
--	ColorSequenceKeypoint.new(1, white),
--}

--uiGradient.Color = colSequence
--print("finished")
uiGradient.Enabled = true

while (true) do
	wait()
	local stage = leaderboard.Stage.Value
	if stage == 0 then 
		uiGradient.Enabled = false
		frame.BackgroundColor3 = lightBlue
		indicator.Text = "Stage: 0 (0%)"
	elseif stage == maxStages then
		uiGradient.Enabled = false
		frame.BackgroundColor3 = green
		indicator.Text = "Stage: 300 (100%)"
	else
		uiGradient.Enabled = true
		frame.BackgroundColor3 = white
		local colSequence = ColorSequence.new{
			ColorSequenceKeypoint.new(0, green),
			ColorSequenceKeypoint.new(stage/maxStages, green),
			ColorSequenceKeypoint.new(stage/maxStages + .0001, lightBlue),
			ColorSequenceKeypoint.new(1, lightBlue),
		}	
		uiGradient.Color = colSequence
		indicator.Text = "Stage: " .. stage .. " (" .. math.floor(stage/maxStages*1000)/10 .. "%)"
	end
	--	arrow.Transparency = 1
	--elseif Checkpoints:FindFirstChild(tostring(stage+1)) then
	--	moving = true
	--	current_pos =Checkpoints[tostring(stage+1)].CFrame * CFrame.new(0,9,0) * CFrame.Angles(0,math.rad(90),math.rad(-90))
	--	TweenService:Create(arrow,TweenInfo.new(1),{CFrame=Checkpoints[tostring(val+1)].CFrame * CFrame.new(0,9,0) * CFrame.Angles(0,math.rad(90),math.rad(-90))}):Play()
	--	wait(1)
	--	moving = false
end

	