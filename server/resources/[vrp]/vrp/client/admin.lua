
local noclip = false
local noclip_speed = 1.0
local noclip_fspeed = 2.0
local frozen = false
local unfreeze = false

function tvRP.toggleNoclip()
    local ped = GetPlayerPed(-1)
    noclip = not noclip
    if noclip then -- set
        SetEntityInvincible(ped, true)
        SetEntityVisible(ped, false, false)
    else -- unset
        SetEntityInvincible(ped, false)
        SetEntityVisible(ped, true, false)
    end
    local coords = GetEntityCoords(ped)
    return {coords={coords["x"],coords["y"],coords["z"]},noclip=noclip}
end

function tvRP.isNoclip()
    return noclip
end

function tvRP.toggleFreeze()
    if frozen then
        frozen = false
        unfreeze = true
        TriggerEvent("pNotify:SendNotification",{text = "Du blev optøet af en admin.",type = "info",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
    else
        frozen = true
        unfreeze = false
        TriggerEvent("pNotify:SendNotification",{text = "Du blev frosset af en admin.",type = "info",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        local currentvehicle = GetVehiclePedIsIn(ped,false)
        if frozen then
            DisableControlAction(0, 23, true) -- enter veh
            DisableControlAction(0, 24, true) -- attack
            DisableControlAction(0, 25, true) -- aim
            DisableControlAction(0, 37, true) -- weapon wheel
            DisableControlAction(0, 44, true) -- cover
            DisableControlAction(0, 45, true) -- reload
            DisableControlAction(0, 75, true) -- exit veh
            DisableControlAction(0, 140, true) -- light attack
            DisableControlAction(0, 141, true) -- heavy attack
            DisableControlAction(0, 142, true) -- alternative attack
            DisablePlayerFiring(ped, true) -- Disable weapon firing
            FreezeEntityPosition(ped,true)
            if IsPedSittingInAnyVehicle(ped) then
                FreezeEntityPosition(currentvehicle,true)
                SetVehicleUndriveable(currentvehicle, true)
                SetVehicleEngineOn(currentvehicle, false, false, false)
            end
        elseif unfreeze then
            FreezeEntityPosition(ped,false)
            if IsPedSittingInAnyVehicle(ped) then
                FreezeEntityPosition(currentvehicle,false)
                SetVehicleUndriveable(currentvehicle, false)
            end
        end
    end
end)

function tvRP.setVehicleDoors(veh, doors)
    SetVehicleDoorsLocked(veh, doors)
end

function tvRP.vehicleUnlockAdmin()
    local ped = GetPlayerPed(-1)
    local veh = tvRP.getNearestVehicle(4)
    local plate = GetVehicleNumberPlateText(veh)

    SetVehicleDoorsLockedForAllPlayers(veh, false)
    SetVehicleDoorsLocked(veh,1)
    SetVehicleDoorsLockedForPlayer(veh, ped, false)

    TriggerEvent("pNotify:SendNotification",{text = "Nærmeste køretøj låst op.",type = "error",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end

-- noclip/invisibility
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if noclip then
            local ped = GetPlayerPed(-1)
            local x,y,z = tvRP.getPosition()
            local dx,dy,dz = tvRP.getCamDirection()
            local speed = noclip_speed
            local fspeed = noclip_fspeed

            -- reset velocity
            SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)

            -- forward
            if IsControlPressed(0,32) then -- MOVE UP
                x = x+speed*dx
                y = y+speed*dy
                z = z+speed*dz
            end

            -- fastforward
            if IsControlPressed(0,21) and IsControlPressed(0,32) then -- LEFT-SHIFT + MOVE UP
                x = x+fspeed*dx
                y = y+fspeed*dy
                z = z+fspeed*dz
            end

            -- backward
            if IsControlPressed(0,269) then -- MOVE DOWN
                x = x-speed*dx
                y = y-speed*dy
                z = z-speed*dz
            end

            SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
        end
    end
end)

local function teleportToWaypoint()
    local targetPed = GetPlayerPed(-1)
    local targetVeh = GetVehiclePedIsUsing(targetPed)
    if(IsPedInAnyVehicle(targetPed))then
        targetPed = targetVeh
    end

    if(not IsWaypointActive())then
        TriggerEvent("pNotify:SendNotification",{text = "Du mangler at sætte et waypoint",type = "warning",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        return
    end

    local waypointBlip = GetFirstBlipInfoId(8) -- 8 = waypoint Id
    local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, waypointBlip, Citizen.ResultAsVector()))

    -- ensure entity teleports above the ground
    local ground
    local groundFound = false
    local groundCheckHeights = {100.0, 150.0, 50.0, 0.0, 200.0, 250.0, 300.0, 350.0, 400.0,450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0}

    for i,height in ipairs(groundCheckHeights) do
        SetEntityCoordsNoOffset(targetPed, x,y,height, 0, 0, 1)
        Wait(10)

        ground,z = GetGroundZFor_3dCoord(x,y,height)
        if(ground) then
            z = z + 3
            groundFound = true
            break;
        end
    end

    if(not groundFound)then
        z = 1000
        GiveDelayedWeaponToPed(PlayerPedId(), 0xFBAB5776, 1, 0) -- parachute
    end

    SetEntityCoordsNoOffset(targetPed, x,y,z, 0, 0, 1)
    TriggerEvent("pNotify:SendNotification",{text = "Teleporteret til waypoint",type = "success",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end
RegisterNetEvent("TpToWaypoint")
AddEventHandler("TpToWaypoint", teleportToWaypoint)