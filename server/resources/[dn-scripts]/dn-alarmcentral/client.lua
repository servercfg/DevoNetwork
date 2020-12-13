local ready = false
AddEventHandler("playerSpawned",function() -- delay state recording
    Citizen.CreateThread(function()
        Citizen.Wait(30000)
        ready = true
    end)
end)


Citizen.CreateThread(function()
    while true do
        local player = GetPlayerPed(-1)
        local coords = GetEntityCoords(player)
        Citizen.Wait(1)
        if IsPedShooting(player) then
            if CheckDistance(true) then
                local message = "^7^*En person affyrer skud ved " .. GetStreetName(coords) .. "!"
                NotifyPeople(message,coords,true)
            end
            Citizen.Wait(10000)
        end
    end
end)


local blipList = {}
RegisterNetEvent('notifyDispatch')
AddEventHandler('notifyDispatch', function(x,y,z,message)
    local blip = AddBlipForCoord(x+0.001,y+0.001,z+0.001)
    SetBlipSprite(blip, 304)
    SetBlipColour(blip, 67)
    SetBlipAlpha(blip, 250)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Alarmcentralen")
    SetBlipScale(blip, 0.6)
    EndTextCommandSetBlipName(blip)

    blipList[blip] = 30000

    --Citizen.Trace("x:" .. x .. " y:" .. y .. " z:" .. z)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    TriggerEvent('chatMessage', '^3[Alarmcentralen]', "^3[Alarmcentralen]", message)
end)

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(blipList) do
            if v == 0 then
                RemoveBlip(k)
                blipList[k] = nil
            else
                blipList[k] = blipList[k]-1
            end
        end
        Citizen.Wait(1)
    end
end)

local pedtypes = {0,1,2,20,6,4,5,26}
function canPedBeUsed(ped)
    if ped == nil then
        return false
    end
    if ped == GetPlayerPed(-1) then
        return false
    end
    if not DoesEntityExist(ped) then
        return false
    end
    if GetVehiclePedIsUsing(ped) ~= 0 then
        return false
    end
    for a = 0, 32 do
        if GetPlayerPed(a) == ped then
            return false
        end
    end
    for k,v in pairs(pedtypes) do
        if GetPedType(ped) == v then
            return true
        end
    end
    return false
end

function CheckDistance(alert)
    local pedCoords = GetEntityCoords(PlayerPedId())
    for ped in EnumeratePeds() do
        if GetEntityHealth(ped) ~= 0 then
            local distanceCheck = GetDistanceBetweenCoords(pedCoords, GetEntityCoords(ped), true)
            if distanceCheck <= 100.0  then
                if canPedBeUsed(ped) then
                    if alert then
                        if GetPedAlertness(ped) >= 1 then
                            return true
                        end
                    else
                        return true
                    end
                end
            end
        end
    end
    return false
end

function GetStreetName(playerPos)
    local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, playerPos.x, playerPos.y, playerPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)

    if s2 == 0 then
        return street1
    elseif s2 ~= 0 then
        return street1 .. " - " .. street2
    end
end

function NotifyPeople(message, pos, bool)
    if bool then
        TriggerServerEvent('dispatchpolice', pos.x, pos.y, pos.z, message)
    else
        TriggerServerEvent('dispatch', pos.x, pos.y, pos.z, message)
    end
end