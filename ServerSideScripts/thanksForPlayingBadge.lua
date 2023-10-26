local badgeService = game:GetService("BadgeService")
local players = game:GetService("Players")
player = game.Players.LocalPlayer

--when player added
players.PlayerAdded:Connect(function(player)
	wait(3)
	badgeService:AwardBadge(player.UserId, 2141836379) --awarding "Thanks For Playing" badge
end)