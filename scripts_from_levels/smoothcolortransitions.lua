local part = script.Parent 

local hue = 6/36 -- Set starting hue value

while true do
	for i = 0, 1, 0.01 do -- Adjust the increment value for smoother or faster transitions
		hue = hue + 0.01 -- Adjust the increment value for smoother or faster transitions
		if hue > 1 then
			hue = 0
		end

		local color = Color3.fromHSV(hue, 1, 1) -- Convert hue to RGB color
		--Change textcolor3 with any property that has to do with color
		part.Color = color -- Apply color to the part

		wait(0.05) -- Adjust the delay between color transitions
	end
end