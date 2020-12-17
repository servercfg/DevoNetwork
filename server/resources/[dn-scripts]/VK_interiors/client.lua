POS_actual = 1
PED_hasBeenTeleported = false

function teleport(pos)
    local ped = GetPlayerPed(-1)
    Citizen.CreateThread(function()
        PED_hasBeenTeleported = true
        local vehicle = GetVehiclePedIsIn(ped, false)
        if vehicle ~= 0 and pos.withcar then
            Citizen.Wait(500)
            SetEntityCoordsNoOffset(vehicle, pos.x, pos.y, pos.z, 0, 0, 1)
            SetEntityHeading(vehicle, pos.h)
            Citizen.Wait(500)
        else
            NetworkFadeOutEntity(ped, true, false)
            Citizen.Wait(500)

            SetEntityCoords(ped, pos.x, pos.y, pos.z, 1, 0, 0, 1)
            SetEntityHeading(ped, pos.h)
            NetworkFadeInEntity(ped, 0)

            Citizen.Wait(500)
        end
        PED_hasBeenTeleported = false
    end)
end

function ply_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if PED_hasBeenTeleported == false then
            local ped = GetPlayerPed(-1)
            local playerPos = GetEntityCoords(ped, true)

            for i,pos in pairs(INTERIORS) do
                if pos.withcar then
                    DrawMarker(27, pos.x, pos.y, pos.z-0.99, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 0.5001, 83, 255, 87, 200, 0, 0, 0, 50)
                else
                    DrawMarker(27, pos.x, pos.y, pos.z-0.99, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5001, 83, 255, 87, 200, 0, 0, 0, 50)
                end
                if (Vdist(playerPos.x, playerPos.y, playerPos.z, pos.x, pos.y, pos.z) < ((pos.withcar) and 2.0 or 1.0)) and (not PED_hasBeenTeleported) then
                    ply_drawTxt(INTERIORS[pos.destination[1]].name:gsub("%%key", "~g~E~w~"),4,1,0.5,0.8,0.6,255,255,255,255)
                    POS_actual = pos.id
                    if IsControlJustPressed(1, 51) then
                        teleport(INTERIORS[pos.destination[1]])
                    end
                end
            end
        end
    end
end)