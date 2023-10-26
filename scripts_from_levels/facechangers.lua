-- Assisted on this code

local head = script.Parent
local sound = head:findFirstChild("Victory")

function onTouched(part)
	local h = part.Parent:findFirstChild("Humanoid")
	if h~=nil then
sound:play()
-- finds player's face decal and replaces it with new image id
if part.Parent:findFirstChild("Head"):findFirstChild("face").Texture == nil then return end
part.Parent:findFirstChild("Head"):findFirstChild("face").Texture="http://www.roblox.com/asset/?id=" -- enter id number of face after id=
	end
end

script.Parent.Touched:connect(onTouched)