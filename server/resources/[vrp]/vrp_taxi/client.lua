-- Settings
local enableTaxiGui = true -- Enables the GUI (Default: true)
local fareCost = 10 --(1.66 = $100 per minute) Cost per second
local costPerMile = 100
local initialFare = 100.0 -- the cost to start a fare

local testMode = false -- enables spawn car command


DecorRegister("fares", 1)
DecorRegister("miles", 1)
DecorRegister("meteractive", 2)

-- NUI Variables
local inTaxi = false
local meterOpen = false
local meterActive = false


-- Open Gui and Focus NUI
function openGui()
  SendNUIMessage({openMeter = true})
end

-- Close Gui and disable NUI
function closeGui()
  SendNUIMessage({openMeter = false})
  meterOpen = false
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(5000)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)
    if IsInTaxi() and GetPedInVehicleSeat(veh, -1) ~= ped then
      local ped = GetPlayerPed(-1)
      local veh = GetVehiclePedIsIn(ped, false)
      TriggerServerEvent("taxi:update", veh)
      TriggerServerEvent("taxi:syncmeter", veh)
      openGui()
      meterOpen = true
    end
    if meterActive and GetPedInVehicleSeat(veh, -1) == ped then
      local _fare = DecorGetFloat(veh, "fares")
      local _miles = DecorGetFloat(veh, "miles")
      DecorSetFloat(veh, "fares", _fare + fareCost)
      DecorSetFloat(veh, "miles", _miles + round(GetEntitySpeed(veh) * 0.002821371, 5))
      TriggerServerEvent("taxi:syncmeter", veh)
    end
    if IsInTaxi() and not GetPedInVehicleSeat(veh, -1) == ped then
        TriggerServerEvent("taxi:syncmeter", veh)
    end
  end
end)

-- If GUI setting turned on, listen for INPUT_PICKUP keypress
if enableTaxiGui then
  Citizen.CreateThread(function()
    TriggerEvent("pNotify:SetQueueMax", "taxi", 1)
    while true do
      Citizen.Wait(0)
      if(IsInTaxi()) then
        if (inTaxi == false) then
          TriggerEvent("pNotify:SendNotification",{text = "Tryk <b>E</b> for at starte taxameteret",type ="info",timeout=(2000),layout ="bottomCenter",queue ="taxi",animation ={open ="gta_effects_fade_in",close ="gta_effects_fade_out"}})
        end
        inTaxi = true
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped, false)
        if(IsInTaxi() and GetPedInVehicleSeat(veh, -1) == ped) then
          if IsControlJustPressed(1, 51)  then -- IF INPUT_PICKUP Is pressed
              if meterOpen then
                closeGui()
                meterOpen = false
              else
                local ped = GetPlayerPed(-1)
                local veh = GetVehiclePedIsIn(ped, false)
                local _fare = DecorGetFloat(veh, "fares")
                if _fare < initialFare then
                  DecorSetFloat(veh, "fares", initialFare)
                end
                TriggerServerEvent("taxi:update", veh)
                TriggerServerEvent("taxi:syncmeter", veh)
                openGui()
                meterOpen = true
              end
            end
            if IsControlJustPressed(1, 246)  then -- IF INPUT_PICKUP Is pressed
                if meterActive then
                    SendNUIMessage({meterActive = false})
                    meterActive = false
                    DecorSetInt(veh, "meteractive", false)
                else
                    SendNUIMessage({meterActive = true})
                    meterActive = true
                    DecorSetInt(veh, "meteractive", true)
                end
              end
            end
            if IsControlJustPressed(1, 7)  then -- IF INPUT_PICKUP Is pressed
              local _fare = DecorGetFloat(veh, "fares")
              local _miles = DecorGetFloat(veh, "miles")
              DecorSetFloat(veh, "fares", initialFare)
              DecorSetFloat(veh, "miles", 0.0)
              TriggerServerEvent("taxi:syncmeter", veh)
            end
      else
        if(meterOpen) then
          closeGui()
        end
        meterOpen = false
      end
    end
  end)
end

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

-- NUI Callback Methods
RegisterNUICallback('close', function(data, cb)
  closeGui()
  cb('ok')
end)



-- Check if player is in a vehicle
function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

-- Check if player is in a Taxi
function IsInTaxi()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  local model = GetEntityModel(veh)
  if model == GetHashKey("taxi") or model == GetHashKey("TAXI_FT2016") then
    return true
  else
    return false
  end
end


-- Check if player is in a Taxi
function ReturnVehicle()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  local model = GetEntityModel(veh)
  local displaytext = GetDisplayNameFromVehicleModel(model)
  local name = GetLabelText(displaytext)
end

-- Check if player is near another player
function IsNearPlayer(player)
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
  local ply2Coords = GetEntityCoords(ply2, 0)
  local distance = GetDistanceBetweenCoords(ply2Coords["x"], ply2Coords["y"], ply2Coords["z"],  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
  if(distance <= 5) then
    return true
  end
end




-- Send NUI message to update
RegisterNetEvent('taxi:updatefare')
AddEventHandler('taxi:updatefare', function(veh)
  local id = PlayerId()
  local playerName = GetPlayerName(id)
  local _fare = DecorGetFloat(veh, "fares")
  local _miles = DecorGetFloat(veh, "miles")
  local farecost = _fare + (_miles * costPerMile)


	SendNUIMessage({
		updateBalance = true,
		balance = string.format("%.2f", farecost),
    player = string.format("%.2f", _miles),
    meterActive = DecorGetBool(veh, "meteractive")
	})
end)


if testMode then

  RegisterNetEvent('VehicleSpawn')
  AddEventHandler('VehicleSpawn', function(vehicleName)
    local myPed = GetPlayerPed(-1)
    local player = PlayerId()
    local vehicle = GetHashKey(vehicleName)
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
      Wait(1)
    end
    local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
    local spawned_car = CreateVehicle(vehicle, coords, GetEntityHeading(myPed), true, false)
    SetVehicleOnGroundProperly(spawned_car)
    SetModelAsNoLongerNeeded(vehicle)
    Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(spawned_car))
  end)

  Citizen.CreateThread(function()
    while true do
      Wait(1)
    end
  end)
end
