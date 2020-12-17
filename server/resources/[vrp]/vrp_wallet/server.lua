local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_wallet")

RegisterServerEvent('vrp_wallet:getMoneys')
AddEventHandler('vrp_wallet:getMoneys', function()
	local user_id = vRP.getUserId({source})

	if user_id then
		local money = vRP.getMoney({user_id})
		local bank = vRP.getBankMoney({user_id})

	    	TriggerClientEvent("vrp_wallet:setValues", source, money, bank)
	end
end)
