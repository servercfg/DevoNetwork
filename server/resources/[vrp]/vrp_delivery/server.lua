local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_delivery")


RegisterServerEvent('delivery:checkjob')
AddEventHandler('delivery:checkjob', function()
	local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})

    if vRP.hasPermission({user_id,"delivery.gopostal"}) then --here check if you have permission
      TriggerClientEvent('yesdelivery', source)
    else
      TriggerClientEvent('nodelivery', source)
    end
end)

--Essential payment functions 

RegisterServerEvent('delivery:success')
AddEventHandler('delivery:success', function(amount)
	-- Get the players money amount
local source = source
local user_id = vRP.getUserId({source})
local money = vRP.getBankMoney({user_id})
 -- update player money amount
vRP.giveBankMoney({user_id,amount})
TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..amount.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end)