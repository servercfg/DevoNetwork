local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_chests")

--- Config
-- list of static chests
-- {access, x, y, z, name-optional}
-- access = can be user_id, user_permission or user_group. Set it to "none" to give to all players access to the chest.
-- name = if you have multiple chests with same access you need to set different name, or the chests with same access will containt same items.
local chests = {}
chests = {
	{"Royal Reapers", -808.29809570313,175.27745056152,76.740791320801, "Royal Reapers"},
	{"Hells Angels", 977.18389892578,-104.06502532959,74.845169067383, "Hells Angels"},
	{"Lost Ledelse", -574.53649902344,293.49392700195,79.176689147949, "The Lost MC Ledelse Kiste"}, -- -576.94177246094,286.802734375,79.176574707031
	{"Lost Medlem", -571.56488037109,285.34844970703,79.176689147949, "The Lost MC Kiste"}, -- -576.94177246094,286.802734375,79.176574707031
	{"Black Army", 330.05987548828,-2014.3515625,22.394878387451, "Black Army"},
	{"Politi-Job", 478.48883056641,-984.86486816406,24.914697647095, "Politi-Job"}
}
-- I've put some random locations just for test, change them.
---#

local function create_pleschest(owner_access, x, y, z, player, name)
	local namex = name or "chest"
	
	local chest_enter = function(player, area)
		local user_id = vRP.getUserId({player})
		if user_id ~= nil then
			if owner_access == "none" or user_id == tonumber(owner_access) or vRP.hasGroup({user_id, owner_access}) or vRP.hasPermission({user_id, owner_access}) then
				vRP.openChest({player, "static:"..owner_access..":"..namex, 500, nil, nil, nil})
			end
		end
	end

	local chest_leave = function(player,area)
		vRP.closeMenu({player})
	end
	
	local nid = "vRP:static-"..namex..":"..owner_access
	vRPclient.setNamedMarker(player,{nid,x,y,z-1,0.7,0.7,0.5,0,148,255,125,150})
	vRP.setArea({player,nid,x,y,z,1,1.5,chest_enter,chest_leave})
end

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
  if first_spawn then
	for k, v in pairs(chests) do
		create_pleschest(v[1], v[2], v[3], v[4], source, v[5])
		--TriggerClientEvent('chatMessage', -1, "Chest created: "..v[1]..", "..v[2]..", "..v[3]..", "..v[4]..", "..v[5]..".") -- debuging.
	end
  end
end)
