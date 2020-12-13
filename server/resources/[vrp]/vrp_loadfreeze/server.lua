--Settings--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_loadfreeze")

-- unfreeze on spawn

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
	local player = source
	--TriggerClientEvent('moveme',player)
	SetTimeout(30000,function()
	TriggerClientEvent('vRPlf:Unfreeze',player,false)
	
	local user_id = vRP.getUserId({source})
 	local player = vRP.getUserSource({user_id})
  	vRP.getUserIdentity({user_id, function(identity)
	TriggerClientEvent('eyes',player,identity.eyes)
  	end})

	end)
end)

RegisterServerEvent("eye:color")
AddEventHandler("eye:color", function()
	local user_id = vRP.getUserId({source})
 	local player = vRP.getUserSource({user_id})
  	vRP.getUserIdentity({user_id, function(identity)
	TriggerClientEvent('eyes',player,identity.eyes)
  	end})
end)