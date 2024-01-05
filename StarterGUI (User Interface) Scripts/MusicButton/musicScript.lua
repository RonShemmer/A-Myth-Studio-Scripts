local music = game.Workspace.BackgroundMusic -- Name the sound "Music"
local volume = .1
local transparency = 0
local playing = true

script.Parent.MouseButton1Click:Connect(function()
	print("music button clicked")
	playing = not playing
	if (not playing) then
		music.BackgroundMusic1.Volume = 0
		music.BackgroundMusic2.Volume = 0
		music.BackgroundMusic3.Volume = 0
		music.BackgroundMusic4.Volume = 0
		music.BackgroundMusic5.Volume = 0
		music.BackgroundMusic6.Volume = 0
		music.BackgroundMusic7.Volume = 0
		music.BackgroundMusic8.Volume = 0
		music.BackgroundMusic9.Volume = 0
		music.BackgroundMusic10.Volume = 0
		script.Parent.ImageTransparency = 0.5
	else
		music.BackgroundMusic1.Volume = 0.1
		music.BackgroundMusic2.Volume = 0.1
		music.BackgroundMusic3.Volume = 0.1
		music.BackgroundMusic4.Volume = 0.1
		music.BackgroundMusic5.Volume = 0.1
		music.BackgroundMusic6.Volume = 0.1
		music.BackgroundMusic7.Volume = 0.1
		music.BackgroundMusic8.Volume = 0.1
		music.BackgroundMusic9.Volume = 0.1
		music.BackgroundMusic10.Volume = 0.1
		script.Parent.ImageTransparency = 0
	end
end)
