RegisterNetEvent('hp:deletevehicle')
local distanceToCheck = 5.0

AddEventHandler('hp:deletevehicle',function()
    local ped = GetPlayerPed(-1)
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        local pos = GetEntityCoords(ped)
        if (IsPedSittingInAnyVehicle(ped)) then 
            local vehicle = GetVehiclePedIsIn(ped,false)
            if (GetPedInVehicleSeat(vehicle,-1) == ped) then 
                SetEntityAsMissionEntity(vehicle,true,true)
                deleteCar(vehicle)
                if (DoesEntityExist(vehicle)) then 
					TriggerEvent("pNotify:SendNotification",{text = "Kunne ikke slette bilen, prøv igen",type = "error",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
					else 
					TriggerEvent("pNotify:SendNotification",{text = "Køretøj slettet",type = "error",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
                end 
					else 
					TriggerEvent("pNotify:SendNotification",{text = "Du skal være i føresædet",type = "error",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
            end 
        else
            local playerPos = GetEntityCoords(ped,1)
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(ped,0.0,distanceToCheck,0.0)
            local vehicle = GetVehicleInDirection(playerPos,inFrontOfPlayer)

            if (DoesEntityExist(vehicle)) then 
                SetEntityAsMissionEntity(vehicle,true,true)
                deleteCar(vehicle)

                if (DoesEntityExist(vehicle)) then 
                	TriggerEvent("pNotify:SendNotification",{text = "Kunne ikke slette bilen, prøv igen",type = "error",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
					else 
					TriggerEvent("pNotify:SendNotification",{text = "Køretøj slettet",type = "error",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                end 
					else 
					TriggerEvent("pNotify:SendNotification",{text = "Du skal være i nærheden af bilen, eller i føresædet",type = "error",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end 
        end 
    end 
end)

function deleteCar(entity)
    Citizen.InvokeNative(0xEA386986E786A54F,Citizen.PointerValueIntInitialized(entity))
end

function GetVehicleInDirection(coordFrom,coordTo)
    local rayHandle = CastRayPointToPoint(coordFrom.x,coordFrom.y,coordFrom.z,coordTo.x,coordTo.y,coordTo.z,10,GetPlayerPed(-1),0)
    local _,_,_,_,vehicle = GetRaycastResult(rayHandle)
    return vehicle
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false,false)
end

RegisterNetEvent('hp:spawnvehicle')
AddEventHandler('hp:spawnvehicle',function(car)
  -- load vehicle model
  local mhash = GetHashKey(car)

  local i = 0
  while not HasModelLoaded(mhash) and i < 10000 do
    RequestModel(mhash)
    Citizen.Wait(10)
    i = i+1
  end

  -- spawn car
  if HasModelLoaded(mhash) then
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
    local nveh = CreateVehicle(mhash, x,y,z+0.5, GetEntityHeading(GetPlayerPed(-1)), true, false) -- added player heading
    SetVehicleOnGroundProperly(nveh)
    SetEntityInvincible(nveh,false)
    SetPedIntoVehicle(GetPlayerPed(-1),nveh,-1) -- put player inside
    SetEntityAsMissionEntity(nveh, true, true) -- set as mission entity
	  
	Citizen.CreateThread(function()
	    Citizen.Wait(1000)
		TriggerEvent("advancedFuel:setEssence", 100, GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))), GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1)))))
	end)

    SetModelAsNoLongerNeeded(mhash)
	TriggerEvent("pNotify:SendNotification",{
    text = "Køretøj spawned.",
    type = "success",
    timeout = (1000),
    layout = "centerRight",
    queue = "global",
	animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
	killer = true
	})	
  end
end)