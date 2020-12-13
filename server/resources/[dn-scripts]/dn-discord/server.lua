local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")

RegisterServerEvent('vRP:Discord')
AddEventHandler('vRP:Discord', function()
    local user_id = vRP.getUserId({source})
    local faction = vRP.getUserGroupByType({user_id,"job"})
    local name = vRP.getPlayerName({source})
	TriggerClientEvent('vRP:Discord-rich', source, user_id, faction, name)
end)
