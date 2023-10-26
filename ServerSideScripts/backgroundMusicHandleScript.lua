local MusicFolder = game.Workspace:WaitForChild("BackgroundMusic") --folder with the audio files

wait(2)

--continually loops through and plays all audio files in the folder
while true do
	
	for i,v in pairs(MusicFolder:GetChildren()) do
		v.Playing = true
		wait(v.TimeLength)
		v.Playing = false
		wait(1)
	end
end

