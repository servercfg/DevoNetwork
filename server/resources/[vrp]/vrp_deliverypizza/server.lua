local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_deliverypizza")


RegisterServerEvent('delivery:checkjob1')
AddEventHandler('delivery:checkjob1', function()
    local source = source
    local user_id = vRP.getUserId({source})

    if vRP.hasPermission({user_id,"delivery.pizza"}) then --here check if you have permission
        TriggerClientEvent('yesdelivery2', source)
    else
        TriggerClientEvent('nodelivery2', source)
    end
end)

--Essential payment functions 

RegisterServerEvent('delivery:success1')
AddEventHandler('delivery:success1', function(amount)
    -- Get the players money amount
    local source = source
    local user_id = vRP.getUserId({source})
    local money = vRP.getBankMoney({user_id})
    -- update player money amount
    vRP.giveBankMoney({user_id,amount})
    TriggerClientEvent("pNotify:SendNotification", source,{text = "<h3>💰Modtog <b style='color: #4E9350'>"..amount.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end)