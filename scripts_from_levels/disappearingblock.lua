local KillBrick = script.Parent

while wait() do
	wait(2)
	--transitions block to becoming invisible
    for i=0,1,.01 do
		KillBrick.Transparency = i
		wait()
	end
	wait(2)
    --transitions block back to being visible
	for i = 1,0,-.01 do
		KillBrick.Transparency = i
		wait()
	end
	wait(3)
end