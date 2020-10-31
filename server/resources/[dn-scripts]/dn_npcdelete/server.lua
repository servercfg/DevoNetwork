local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","hp_npcdelete")
npcdclient = Tunnel.getInterface("hp_npcdelete","hp_npcdelete")
local user_id = 0

AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype)
  local player = vRP.getUserSource({user_id})
  user_id = user_id
  if gtype == "job" then 
    if vRP.hasPermission({user_id, "police.weapons"}) or vRP.hasPermission({user_id, "emergency.taser"}) then
	  TriggerClientEvent("hp:npcdelete", player, true)
	else
	  TriggerClientEvent("hp:npcdelete", player, false)
	end
  end
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
  local player = vRP.getUserSource({user_id})
  user_id = user_id
    if vRP.hasPermission({user_id, "police.weapons"}) or vRP.hasPermission({user_id, "emergency.taser"}) then
	  TriggerClientEvent("hp:npcdelete", player, true)
	else
	  TriggerClientEvent("hp:npcdelete", player, false)
	end
end)