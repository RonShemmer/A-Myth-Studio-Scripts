--gives trails to players who have enough stages when they equip it, saves trails, loads trails, etc

local PlayersService=game:GetService('Players')
local DataStore=game:GetService('DataStoreService'):GetDataStore(":Trails7") -- Data store Trails1-6 are old, can't reset. use Trails7
--[[]]--
local CreateStats={
	['Create']=false; -- Turn to False, If You Already Have Leaderstats
	['Name']="Total" -- Change to Your Currency, Which You Already Have, or want to Create
}
local TrailList=require(game.ReplicatedStorage:WaitForChild('TrailList'))
--[[]]--

--loading all owned trails data for a player
local function LoadTrailData(Player)
	local UserId = Player.UserId
	local Success, DataArray = pcall(DataStore.GetAsync, DataStore, UserId)
	if Success and DataArray then
		for a, b in pairs(DataArray.OwnedTrails) do 
			local x=Instance.new('StringValue')
			x.Name=b 
			x.Parent=Player.OwnedTrails
		end
		Player.EquippedTrail.Value=DataArray.EquippedTrail
		if DataArray['Currency'] and CreateStats['Create']==true then
			Player.leaderstats[CreateStats.Name].Value=DataArray['Currency']
		end
	else
	end
end

--saving all the player's owned trails to datastore
local function SaveTrailData(Player)
	local Success,Errormsg = pcall(DataStore.UpdateAsync, DataStore, Player.UserId,function()
		local Array={
			['EquippedTrail']=Player.EquippedTrail.Value;
			['OwnedTrails']={};
		}
		if CreateStats['Create'] then
			Array['Currency']=Player.leaderstats[CreateStats.Name].Value
		end
		for a, b in pairs(Player.OwnedTrails:GetChildren()) do 
			table.insert(Array.OwnedTrails,b.Name)
		end
		return Array
	end)
end

--creates a trail folder for player to use to actively equip/de-equip trails
PlayersService.PlayerAdded:Connect(function(Player)
	local EquippedTrail=Instance.new('StringValue')
	EquippedTrail.Name="EquippedTrail"
	EquippedTrail.Parent=Player
	local OwnedTrails=Instance.new('Folder')
	OwnedTrails.Name="OwnedTrails"
	OwnedTrails.Parent=Player
	if CreateStats['Create'] then
		local Leaderstats=Instance.new('Folder')
		Leaderstats.Name="leaderstats"
		Leaderstats.Parent=Player
		local Currency=Instance.new('IntValue')
		Currency.Name=CreateStats['Name']
		Currency.Parent=Leaderstats
	end
	LoadTrailData(Player)
	local TrailLoaded=Instance.new('BoolValue')
	TrailLoaded.Name="loaded"
	TrailLoaded.Value=true
	TrailLoaded.Parent=Player
	--[[]]--
	local function LoadCharacterTrail(Character)
		delay(1,function()
			local TrailClone=script['TrailStorage'][Player.EquippedTrail.Value]:Clone()
			TrailClone.Parent=Character:WaitForChild("Torso")
			TrailClone.Attachment0=Character.Torso:WaitForChild("NeckAttachment")
			TrailClone.Attachment1=Character.Torso:WaitForChild("WaistFrontAttachment")
		end)
	end
	if Player.Character then LoadCharacterTrail(Player.Character) end
	Player.CharacterAdded:Connect(function(Character)
		Character:WaitForChild('Torso')
		if Player.EquippedTrail.Value~="" then
			LoadCharacterTrail(Character)
		end
	end)
end)

--saves trail data when player leaves
PlayersService.PlayerRemoving:Connect(function(Player)
	if Player:FindFirstChild('loaded') and Player.loaded.Value==true then
		SaveTrailData(Player)
	end
end)

--if game closes for some reason, save trails
game:BindToClose(function()
	if game['Run Service']:IsStudio() then task.wait(1) 
	else
		for a, b in pairs(PlayersService:GetPlayers()) do 
			if b:FindFirstChild('loaded') and b['loaded'].Value==true then
				SaveTrailData(b)
			end
		end
	end
end)
--[[]]--

--when player clicks equip/buy a trail- different functions for each. 
game.ReplicatedStorage.TrailResponse.OnServerInvoke=function(Player,TrailName,Action)
	local Response=false
	local TrailArray
	for a, b in pairs(TrailList) do 
		if b['Name']==TrailName then
			TrailArray=b
			break
		end
	end
	if not TrailArray then return end
	local Actions={
		['Equip']=function()
			if not Player.OwnedTrails:FindFirstChild(TrailName) then return end
			if Player.EquippedTrail.Value==TrailName then return end
			if not Player.Character then return end
			if not Player.Character:FindFirstChild('Torso') then return end
			local Trail=Player.Character.Torso:FindFirstChildWhichIsA("Trail") or nil
			if Trail then Trail:Destroy() end
			Player.EquippedTrail.Value=TrailName
			local TrailClone=script['TrailStorage'][TrailName]:Clone()
			TrailClone.Parent=Player.Character.Torso
			TrailClone.Attachment0=Player.Character.Torso.NeckAttachment
			TrailClone.Attachment1=Player.Character.Torso.WaistFrontAttachment
			Response=true
		end,
		['Unequip']=function()
			if not Player.OwnedTrails:FindFirstChild(TrailName) then return end
			if Player.EquippedTrail.Value~=TrailName then return end
			Player.EquippedTrail.Value=""
			if Player.Character and Player.Character:FindFirstChild('Torso') then
				if Player.Character.Torso:FindFirstChild(TrailName) then
					Player.Character.Torso[TrailName]:Destroy()
				end
			end
			Response=true
		end,
		['Buy']=function()
			if Player.OwnedTrails:FindFirstChild(TrailName) then return end
			if Player.leaderstats[CreateStats.Name].Value>=TrailArray['Price'] then
				local x = Instance.new('StringValue')
				x.Name=TrailName
				x.Parent=Player.OwnedTrails
				Response=true
			end
		end,
	}
	Actions[Action]()
	return Response
end