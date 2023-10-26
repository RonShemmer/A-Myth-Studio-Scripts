local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local part = script.Parent
-- tweenInfo parameters allow for duration and movement styles to vary
local tweenInfo = TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)

local tween = TweenService:Create(part, tweenInfo, {
	-- Actual change in movement of part
    CFrame = part.CFrame * CFrame.new(0,5,0)
})

tween:Play()

local lastPosition = part.Position

RunService.Stepped:Connect(function(_, deltaTime)
	local currentPosition = part.Position
	local deltaPosition = currentPosition - lastPosition

	local velocity = deltaPosition / deltaTime
	part.AssemblyLinearVelocity = velocity
	lastPosition = currentPosition
end)