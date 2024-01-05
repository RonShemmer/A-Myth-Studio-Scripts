local frame = script.Parent.Frame
local label = frame.TextLabel

game.ReplicatedStorage.KilledPlayer.OnClientEvent:Connect(function(player)
	label.Text = player.Name.." Killed You"
	frame.Visible = true
	wait(5)
	frame.Visible = false
end)