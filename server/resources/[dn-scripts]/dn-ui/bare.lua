function AddTextEntry(key, value)
    Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
    AddTextEntry('FE_THDR_GTAO', 'Devo~r~Network~w~ | discord.gg/zFRgZzG')
end)

local frontwindowup = true
RegisterNetEvent("RollWindowFront")
AddEventHandler('RollWindowFront', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed,false) then
        local playerCar = GetVehiclePedIsIn(playerPed,false)
        if (GetPedInVehicleSeat( playerCar,-1) == playerPed) then
            if (frontwindowup) then
                RollDownWindow(playerCar,0)
                RollDownWindow(playerCar,1)
                frontwindowup = false
            else
                RollUpWindow(playerCar, 0)
                RollUpWindow(playerCar, 1)
                frontwindowup = true
            end
        end
    end
end)
local backwindowup = true
RegisterNetEvent("RollWindowBack")
AddEventHandler('RollWindowBack', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed,false) then
        local playerCar = GetVehiclePedIsIn(playerPed,false)
        if (GetPedInVehicleSeat(playerCar,-1) == playerPed) then
            if (backwindowup) then
                RollDownWindow(playerCar,2)
                RollDownWindow(playerCar,3)
                backwindowup = false
            else
                RollUpWindow(playerCar, 2)
                RollUpWindow(playerCar, 3)
                backwindowup = true
            end
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        if IsControlJustPressed(0,10) then
            TriggerEvent('RollWindowFront')
        elseif IsControlJustPressed(0,11) then
            TriggerEvent('RollWindowBack')
        end
        Citizen.Wait(10)
    end
end)