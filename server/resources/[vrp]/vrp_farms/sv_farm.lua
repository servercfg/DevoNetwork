local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_farms")

local cfg = module("vrp", "cfg/item_transformers")

Citizen.CreateThread(function()
    for k,v in pairs(cfg.hidden_transformers) do
        if v.def.emote == nil then
            print("\n^1--- JENO TRANSFORMER ZONES ---")
            print("\n["..v.def.name.."]  not configured right")
            print("\n--- JENO TRANSFORMER ZONES ---^0")
        end
    end
end)

local function markers_lort(source)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})

    for k,v in pairs(cfg.hidden_transformers) do
        pos = table.unpack(v.positions)
        x,y,z = table.unpack(pos)

        local animations_enter = function(player,area)
            TriggerClientEvent('getserver:dataAnimation',player,true,v.def.emote,v.def.name)
        end
            
            -- leave
        local animations_leave = function(player,area)
            TriggerClientEvent('getserver:dataAnimation',player,false)
        end

        vRP.setArea({source,v.def.name,x,y,z,v.def.radius,v.def.radius,animations_enter,animations_leave})
        --vRPclient.addMarker(source,{x,y,z-1,v.def.radius,v.def.radius,0.7,0,125,255,125,150})
    end
end

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if first_spawn then
        markers_lort(source)
    end
end)

RegisterServerEvent('reloadFarmNames')
AddEventHandler('reloadFarmNames',function()
    for k,v in pairs(cfg.hidden_transformers) do
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        TriggerClientEvent('reload:data',player,v.def.name)
    end
end)