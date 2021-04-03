--bind client tunnel interface
vRPbm = {}
Tunnel.bindInterface("vRP_basic_menu",vRPbm)
vRPserver = Tunnel.getInterface("vRP","vRP_basic_menu")
HKserver = Tunnel.getInterface("vrp_hotkeys","vRP_basic_menu")
BMserver = Tunnel.getInterface("vRP_basic_menu","vRP_basic_menu")
vRP = Proxy.getInterface("vRP")

local frozen = false
local unfrozen = false
function vRPbm.loadFreeze(notify,god,ghost)
	if not frozen then
	  if notify then
	    TriggerEvent("pNotify:SendNotification", {text = "Du er blevet frosset!", type = "warning", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
	  end
	  frozen = true
	  invincible = god
	  invisible = ghost
	  unfrozen = false
	else
	  if notify then
	    TriggerEvent("pNotify:SendNotification", {text = "Du sat fri!", type = "warning", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
	  end
	  unfrozen = true
	  invincible = false
	  invisible = false
	end
end

function vRPbm.lockpickVehicle(wait,any)
	Citizen.CreateThread(function()
		local pos = GetEntityCoords(GetPlayerPed(-1))
		local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 20.0, 0.0)

		local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
		local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
		if DoesEntityExist(vehicleHandle) then
		  if GetVehicleDoorsLockedForPlayer(vehicleHandle,PlayerId()) or any then
			local prevObj = GetClosestObjectOfType(pos.x, pos.y, pos.z, 10.0, GetHashKey("prop_weld_torch"), false, true, true)
			if(IsEntityAnObject(prevObj)) then
				SetEntityAsMissionEntity(prevObj)
				DeleteObject(prevObj)
			end
			StartVehicleAlarm(vehicleHandle)
			TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING", 0, true)
			Citizen.Wait(wait*1000)
			SetVehicleDoorsLocked(vehicleHandle, 1)
			for i = 1,64 do 
				SetVehicleDoorsLockedForPlayer(vehicleHandle, GetPlayerFromServerId(i), false)
			end 
			ClearPedTasksImmediately(GetPlayerPed(-1))
			
			TriggerEvent("pNotify:SendNotification", {text = "Køretøj låst op!", type = "warning", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
			
			-- ties to the hotkey lock system
			local plate = GetVehicleNumberPlateText(vehicleHandle)
			HKserver.lockSystemUpdate({1, plate})
			HKserver.playSoundWithinDistanceOfEntityForEveryone({vehicleHandle, 10, "unlock", 1.0})
		  else
			TriggerEvent("pNotify:SendNotification", {text = "Køretøj allerede åbnet!", type = "info", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
		  end
		else
			TriggerEvent("pNotify:SendNotification", {text = "For langt væk fra Køretøjet!", type = "info", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
		end
	end)
end

function vRPbm.spawnVehicle(model) 
    -- load vehicle model
    local i = 0
    local mhash = GetHashKey(model)
    while not HasModelLoaded(mhash) and i < 1000 do
	  if math.fmod(i,100) == 0 then
	    TriggerEvent("pNotify:SendNotification", {text = "Indlæser køretøj!", type = "info", queue = "global", timeout = 1000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
	  end
      RequestModel(mhash)
      Citizen.Wait(30)
	  i = i + 1
    end

    -- spawn car if model is loaded
    if HasModelLoaded(mhash) then
      local x,y,z = vRP.getPosition({})
      local nveh = CreateVehicle(mhash, x,y,z+0.5, GetEntityHeading(GetPlayerPed(-1)), true, false) -- added player heading
      SetVehicleOnGroundProperly(nveh)
      SetEntityInvincible(nveh,false)
      SetPedIntoVehicle(GetPlayerPed(-1),nveh,-1) -- put player inside
      Citizen.InvokeNative(0xAD738C3085FE7E11, nveh, true, true) -- set as mission entity
      SetVehicleHasBeenOwnedByPlayer(nveh,true)
      SetModelAsNoLongerNeeded(mhash)
	  TriggerEvent("pNotify:SendNotification", {text = "Køretøj spawnet", type = "info", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
	else
	  TriggerEvent("pNotify:SendNotification", {text = "Forkert model", type = "warning", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
	end
end

function vRPbm.getArmour()
  return GetPedArmour(GetPlayerPed(-1))
end

function vRPbm.getVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

function vRPbm.getNearestVehicle(radius)
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  local ped = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ped) then
    return GetVehiclePedIsIn(ped, true)
  else
    -- flags used:
    --- 8192: boat
    --- 4096: helicos
    --- 4,2,1: cars (with police)

    local veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001, radius+5.0001, 0, 8192+4096+4+2+1)  -- boats, helicos
    if not IsEntityAVehicle(veh) then veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001, radius+5.0001, 0, 4+2+1) end -- cars
    return veh
  end
end

function vRPbm.deleteVehicleInFrontOrInside(offset)
  local ped = GetPlayerPed(-1)
  local veh = nil
  if (IsPedSittingInAnyVehicle(ped)) then 
    veh = GetVehiclePedIsIn(ped, false)
  else
    veh = vRPbm.getVehicleInDirection(GetEntityCoords(ped, 1), GetOffsetFromEntityInWorldCoords(ped, 0.0, offset, 0.0))
  end
  
  if IsEntityAVehicle(veh) then
    SetVehicleHasBeenOwnedByPlayer(veh,false)
    Citizen.InvokeNative(0xAD738C3085FE7E11, veh, false, true) -- set not as mission entity
    SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(veh))
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
    TriggerEvent("pNotify:SendNotification", {text = "Køretøj slettet!", type = "info", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
  else
    TriggerEvent("pNotify:SendNotification", {text = "For langt væk fra et køretøj!", type = "warning", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
  end
end

function vRPbm.deleteNearestVehicle(radius)
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  local veh = vRPbm.getNearestVehicle(radius)
  
  if IsEntityAVehicle(veh) then
    SetVehicleHasBeenOwnedByPlayer(veh,false)
    Citizen.InvokeNative(0xAD738C3085FE7E11, veh, false, true) -- set not as mission entity
    SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(veh))
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
    TriggerEvent("pNotify:SendNotification", {text = "Køretøj slettet!", type = "info", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
  else
    TriggerEvent("pNotify:SendNotification", {text = "For langt væk fra et køretøj!", type = "warning", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
  end
end

function vRPbm.setArmour(armour,vest)
  local player = GetPlayerPed(-1)
  if vest then
	if(GetEntityModel(player) == GetHashKey("mp_m_freemode_01")) then
	  SetPedComponentVariation(player, 9, 4, 1, 2)  --Bulletproof Vest
	else 
	  if(GetEntityModel(player) == GetHashKey("mp_f_freemode_01")) then
	    SetPedComponentVariation(player, 9, 6, 1, 2)
	  end
	end
  end
  local n = math.floor(armour)
  SetPedArmour(player,n)
end

local state_ready = false

AddEventHandler("playerSpawned",function() -- delay state recording
  state_ready = false
  
  Citizen.CreateThread(function()
    Citizen.Wait(30000)
    state_ready = true
  end)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(30000)

    if IsPlayerPlaying(PlayerId()) and state_ready then
	  if vRPbm.getArmour() == 0 then
	    if(GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01")) or (GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01")) then
	      SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 1, 2)
		end
	  end
    end
  end
end)

Citizen.CreateThread(function()
	while true do
		if frozen then
			if unfrozen then
				SetEntityInvincible(GetPlayerPed(-1),false)
				SetEntityVisible(GetPlayerPed(-1),true)
				FreezeEntityPosition(GetPlayerPed(-1),false)
				frozen = false
				invisible = false
				invincible = false
			else
				if invincible then
					SetEntityInvincible(GetPlayerPed(-1),true)
				end
				if invisible then
					SetEntityVisible(GetPlayerPed(-1),false)
				end
				FreezeEntityPosition(GetPlayerPed(-1),true)
			end
		end
		Citizen.Wait(0)
	end
end)

function vRPbm.checkVehicle()
  if IsPedInAnyVehicle(GetPlayerPed(-1)) then
  return true
  else
    return false
  end
end