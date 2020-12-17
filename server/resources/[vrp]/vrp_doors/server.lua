
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
local cfg = module("vrp_doors", "config")

local doors = cfg.doors
local owned = {}

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if first_spawn then
        TriggerClientEvent('vrp_doors:load', source, doors)
    end
end)

RegisterServerEvent('vrp_doors:status')
AddEventHandler('vrp_doors:status', function(id, status)
    local user_id = vRP.getUserId({source})
    if (doors[id].key ~= nil and vRP.hasPermission({user_id, "#"..doors[id].key..".>0"})) or (doors[id].permission ~= nil and vRP.hasPermission({user_id,doors[id].permission})) or (doors[id].name ~= nil and doors[id].number ~= nil and owned[doors[id].name] ~= nil and owned[doors[id].name][doors[id].number] ~= nil and owned[doors[id].name][doors[id].number] == user_id) then
        if doors[id].pairs ~= nil then
            doors[doors[id].pairs].locked=status
            TriggerClientEvent('vrp_doors:statusSend', -1, doors[id].pairs, status)
        end
        doors[id].locked=status
        TriggerClientEvent('vrp_doors:statusSend', -1, id, status)
    end
end)

RegisterServerEvent('vrp_doors:owneddoor')
AddEventHandler('vrp_doors:owneddoor', function(user_id,home,number)
    owned[home][tonumber(number)] = user_id
end)

--[[RegisterServerEvent('qwheqwihqeoiq')
AddEventHandler('qwheqwihqeoiq', function()
    TriggerClientEvent('vrp_doors:load', -1, doors)
end)]]