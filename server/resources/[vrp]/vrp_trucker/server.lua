local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_trucker")

RegisterServerEvent('trucker:checkjob')
AddEventHandler('trucker:checkjob', function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})

    if vRP.hasPermission({user_id,"delivery.trucker"}) then --here check if you have permission
        TriggerClientEvent('yestrucker', source)
    else
        TriggerClientEvent('notrucker', source)
    end
end)

--Essential payment functions 

RegisterServerEvent('trucker:success')
AddEventHandler('trucker:success', function(amount)
    -- Get the players money amount
    local source = source
    local user_id = vRP.getUserId({source})
    local toPay = amount + math.random(0,1000)
    -- update player money amount
    vRP.giveBankMoney({user_id,toPay})
    TriggerClientEvent("pNotify:SendNotification", source,{text = "Du modtog <b style='color: #4E9350'>" .. toPay.." DKK</b>.",type = "success",timeout = (5000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end)