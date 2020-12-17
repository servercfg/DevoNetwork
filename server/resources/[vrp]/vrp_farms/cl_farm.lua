vRP = Proxy.getInterface("vRP")

local trash = false
local playingEmote = false


function DrawText3Ds(x,y,z,text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35,0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255,255,255,215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125,0.015+ factor,0.03,41,11,41,68)
end


RegisterNetEvent('getserver:dataAnimation')
AddEventHandler('getserver:dataAnimation',function(status,emote,name)
    trash = status
    emotedic = emote
    farmName = name
end)

RegisterNetEvent('reload:data')
AddEventHandler('reload:data',function(name)
    farmName = name
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        local playerpos = GetEntityCoords(ped)

        if IsControlJustPressed(0,38) and trash then
            playingEmote = true
            FreezeEntityPosition(ped,true)
            TaskStartScenarioInPlace(GetPlayerPed(-1),emotedic,0,true)
        elseif IsControlJustPressed(0,311) and trash then
            playingEmote = false
            FreezeEntityPosition(ped,false)
            ClearPedTasks(ped)
        end


        if trash then
            if not playingEmote and farmName ~= nil then
                DrawText3Ds(playerpos.x,playerpos.y-0.5,playerpos.z+0.5,"Tryk ~g~E~s~ for at ~r~".." "..farmName)
            elseif playingEmote then
                DrawText3Ds(playerpos.x,playerpos.y-0.5,playerpos.z+0.5,"Tryk ~g~K~s~ for at stoppe med at samle ~r~")
            else
                TriggerServerEvent('reloadFarmNames')
                DrawText3Ds(playerpos.x,playerpos.y-0.5,playerpos.z+0.5,"Tryk ~g~E~s~ for ~g~at starte~s~ animationen for~b~".." ".."~r~NIL")
            end
        end
    end
end)