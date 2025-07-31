----------------------------REDEMRP_MENU----------------------------
MenuData = nil 
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
end)
----------------------------END REDEMRP_MENU----------------------------
local TEXTS = Config.Texts
local TEXTURES = Config.Textures
local notifSettings = {}
-----------------------------------------------------------------------------------------------------
local notifSettings = {
	[1] = {
		TEXTS.HuntingTrap, TEXTS.NoPlace, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[2] = {
		TEXTS.HuntingTrap, TEXTS.GoCloser, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[3] = {
		TEXTS.HuntingTrap, TEXTS.NoAnimalNotif, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[4] = {
		TEXTS.HuntingTrap, TEXTS.WaitAnimal, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[5] = {
		TEXTS.HuntingTrap, TEXTS.CantSpawn, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[6] = {
		TEXTS.HuntingTrap, TEXTS.WrongTime, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[7] = {
		TEXTS.HuntingTrap, TEXTS.AnimalSpawn, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[8] = {
		TEXTS.HuntingTrap, TEXTS.IncorrectBait, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[9] = {
		TEXTS.HuntingTrap, TEXTS.NoAnimalNotif2, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[10] = {
		TEXTS.HuntingTrap, TEXTS.NoJob, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[11] = {
		TEXTS.HuntingTrap, TEXTS.LimitReached, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[12] = {
		TEXTS.HuntingTrap, TEXTS.InHand, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[13] = {
		TEXTS.HuntingTrap, TEXTS.NoTrap, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[14] = {
		TEXTS.HuntingTrap, TEXTS.Placed, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[15] = {
		TEXTS.HuntingTrap, TEXTS.CantDo, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[16] = {
		TEXTS.HuntingTrap, TEXTS.NoXP1, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[17] = {
		TEXTS.HuntingTrap, TEXTS.NoMoney, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[18] = {
		TEXTS.HuntingTrap, TEXTS.Purchased, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[19] = {
		TEXTS.HuntingTrap, TEXTS.NoItem, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[20] = {
		TEXTS.HuntingTrap, TEXTS.Sold, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[21] = {
		TEXTS.HuntingTrap, TEXTS.CantAdd, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[22] = {
		TEXTS.HuntingTrap, TEXTS.RemoveBait, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[23] = {
		TEXTS.HuntingTrap, TEXTS.TrapPicked, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[24] = {
		TEXTS.HuntingTrap, TEXTS.TrapBroke, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[25] = {
		TEXTS.HuntingTrap, TEXTS.BaitAdd, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[26] = {
		TEXTS.HuntingTrap, TEXTS.NoBait, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[27] = {
		TEXTS.HuntingTrap, TEXTS.InvalidItem, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[28] = {
		TEXTS.HuntingTrap, TEXTS.BaitAdded, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[29] = {
		TEXTS.HuntingTrap, TEXTS.ConditionBad, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[30] = {
		TEXTS.HuntingTrap, TEXTS.BaitRemove, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[31] = {
		TEXTS.HuntingTrap, TEXTS.CantRemove, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[32] = {
		TEXTS.HuntingTrap, TEXTS.NoBait2, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[33] = {
		TEXTS.HuntingTrap, TEXTS.OilAdded, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[34] = {
		TEXTS.HuntingTrap, TEXTS.NoOil, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[35] = {
		TEXTS.HuntingTrap, TEXTS.CantFix, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[36] = {
		TEXTS.HuntingTrap, TEXTS.OnHunt, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[37] = {
		TEXTS.HuntingTrap, TEXTS.OnHunt2, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[38] = {
		TEXTS.HuntingTrap, TEXTS.CantHunt, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[39] = {
		TEXTS.HuntingTrap, TEXTS.CantHunt2, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[40] = {
		TEXTS.HuntingTrap, TEXTS.NeedXP, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[41] = {
		TEXTS.HuntingTrap, TEXTS.NotOwned, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[42] = {
		TEXTS.HuntingTrap, TEXTS.NewSale, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[43] = {
		TEXTS.HuntingTrap, TEXTS.NoGuide, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[44] = {
		TEXTS.HuntingTrap, TEXTS.BoughtGuide, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[45] = {
		TEXTS.HuntingTrap, TEXTS.InMission, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[46] = {
		TEXTS.HuntingTrap, TEXTS.MissionStart, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[47] = {
		TEXTS.HuntingTrap, TEXTS.MissionFail, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[48] = {
		TEXTS.HuntingTrap, TEXTS.MissionFinish, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[49] = {
		TEXTS.HuntingTrap, TEXTS.MissionCant, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[50] = {
		TEXTS.AnimalTrack, TEXTS.TrackFound, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[51] = {
		TEXTS.AnimalTrack, TEXTS.TrackLast, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[52] = {
		TEXTS.AnimalTrack, TEXTS.AnimalSpawn, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[53] = {
		TEXTS.AnimalTrack, TEXTS.NeedTrap, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[54] = {
		TEXTS.HuntingTrap, TEXTS.NoHunt, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},	
	[55] = {
		TEXTS.HuntingTrap, TEXTS.NoTrap2, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},	
	[56] = {
		TEXTS.HuntingTrap, TEXTS.MissionCD, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[57] = {
		TEXTS.HuntingTrap, TEXTS.NotNext, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[58] = {
		TEXTS.HuntingTrap, TEXTS.CanReset, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[59] = {
		TEXTS.HuntingTrap, TEXTS.MissionCD2, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[60] = {
		TEXTS.HuntingTrap, TEXTS.MissionReset, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	--[[
	[] = {
		TEXTS.TEXT, TEXTS.Saved, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
]]
}

-----------------------------------------------------------------------------------------------------
function CallScriptNotif(id, extra)
	local _id = tonumber(id)
	local title = notifSettings[_id][1]
	local text = notifSettings[_id][2]
	local dict = notifSettings[_id][3]
	local texture = notifSettings[_id][4]
	local timer = notifSettings[_id][5]

------------------EXTRA CODE START------------------
	if extra ~= nil then 						 --|
		if extra.title ~= nil then 				 --|
			title = extra.title					 --|
		end									 	 --|
		if extra.text ~= nil then 				 --|
			text = extra.text					 --|
		end										 --|
		if extra.dict ~= nil then 				 --|
			dict = extra.dict					 --|
		end										 --|
		if extra.texture ~= nil then 			 --|
			texture = extra.texture				 --|
		end										 --|
		if extra.timer ~= nil then 				 --|
			timer = extra.timer					 --|
		end										 --|
	end											 --|
------------------EXTRA CODE END------------------
	TriggerEvent("Notification:ricx_huntertrap", title, text, dict, texture, timer)--change this to a different notification logic if you want
end
-----------------------------------------------------------------------------------------------------
RegisterNetEvent("ricx_huntertrap:call_notif", function(id, extra)
	local _id = tonumber(id)
	CallScriptNotif(_id, extra)
end)
----------------------------Basic Notification----------------------------
RegisterNetEvent('Notification:ricx_huntertrap', function(t1, t2, dict, txtr, timer)
    local _dict = tostring(dict)
    PrepareTexture(_dict)
    exports.ricx_huntertrap.LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
    SetStreamedTextureDictAsNoLongerNeeded(_dict)
end)
--------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('Notification:ricx_huntertrap_right', function(text, dict, icon, text_color, duration)
    PrepareTexture(dict)
    exports.ricx_huntertrap.RightNot(0, text, dict, icon, text_color, duration)
    SetStreamedTextureDictAsNoLongerNeeded(dict)
end)
--------------------------------------------------------------------------------------------------------------------------------------------
function CustomMissionAnimalHandler(ped)--called once the mission of a trapper is finished and the spawned animal is dead
	SetEntityAsNoLongerNeeded(ped)
end
--------------------------------------------------------------------------------------------------------------------------------------------
function CustomAnimalAI(id, ped)
	--for Trappers' mission animals
	if type(id) == "string" then 
		if id == "mission_1_1" then 
			--print("PED ID "..ped)
		elseif id == "mission_1_2" then 
			--print("PED ID "..ped)
			
		--Add here more if required
		end
-----------------------------------------------------------------------------------------------
	--for Config.Animals in config_base_hunt.lua
	elseif type(id) == "number" then 
		if id == 1 then 
			--print("Config.Animals "..id.." spawned, PED ID "..ped)
		elseif id == 2 then 
			--print("Config.Animals "..id.." spawned, PED ID "..ped)

		--Add here more if required
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------