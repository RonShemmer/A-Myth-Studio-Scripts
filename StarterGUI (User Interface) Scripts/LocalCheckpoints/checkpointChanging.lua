local soundEff = game.Workspace["Checkpoint sound effect"].successAudio
local player = game.Players.LocalPlayer
local leaderboard = player:WaitForChild("leaderstats")
local Checkpoints = workspace:WaitForChild("Checkpoints").Stages
local green = Color3.fromRGB(0, 255, 0)
soundEff.Playing = false

leaderboard.Stage.Changed:Connect(function(val)
	if (val ~= 0) then
		local stage = Checkpoints:WaitForChild(val)
		local arrowhead = stage.arrowhead
		local arrowbody = stage.arrowbody
		local border = stage.border
		local base = stage.base
		local p1 = base.ParticleEmitter1
		local p2 = base.ParticleEmitter2
		local p3 = base.ParticleEmitter3
		local p4 = base.ParticleEmitter4
		local p5 = base.ParticleEmitter5
		arrowhead.Color = green
		arrowbody.Color = green
		border.Color = green
		p1.Enabled = true
		p2.Enabled = true
		p3.Enabled = true
		p4.Enabled = true
		p5.Enabled = true
		soundEff.Playing = false
		soundEff.TimePosition = 0
		soundEff.Playing = true
		wait(1)
		p1.Enabled = false
		p2.Enabled = false
		p3.Enabled = false
		p4.Enabled = false
		p5.Enabled = false
	end
end)

