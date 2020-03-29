local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","diving")


RegisterServerEvent('dive:gear')
AddEventHandler('dive:gear', function(swim)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if vRP.tryGetInventoryItem({user_id,"dive",1}) == true then
		TriggerClientEvent('cn:dykkerdragt', player,true)
		Citizen.Wait(10000)
		TriggerClientEvent("pNotify:SendNotification",player,{text = "Forlader du vandet smider du dykker udstyret.",type = "success",timeout = (2000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	else
		--nothing
	end
end)

RegisterCommand('dive', function(source, name)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	--TriggerEvent('dive:gear',source)
	TriggerClientEvent('dive:water', player,true)
end)