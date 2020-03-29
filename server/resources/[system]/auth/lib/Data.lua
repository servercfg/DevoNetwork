--[[
####################################################
#██████╗#██╗######█████╗#███╗###██╗██╗##██╗███████╗#
#██╔══██╗██║#####██╔══██╗████╗##██║██║#██╔╝██╔════╝#
#██████╔╝██║#####███████║██╔██╗#██║█████╔╝#█████╗###
#██╔═══╝#██║#####██╔══██║██║╚██╗██║██╔═██╗#██╔══╝###
#██║#####███████╗██║##██║██║#╚████║██║##██╗███████╗#
#╚═╝#####╚══════╝╚═╝##╚═╝╚═╝##╚═══╝╚═╝##╚═╝╚══════╝#
##################################################3#
--]]

RegisterNetEvent('murtaza:fix')
AddEventHandler('murtaza:fix', function()
  local playerPed = GetPlayerPed(-1)
  if IsPedInAnyVehicle(playerPed, false) then
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    SetVehicleEngineHealth(vehicle, 1000)
    SetVehicleEngineOn( vehicle, true, true )
    SetVehicleFixed(vehicle)
  end
end)

RegisterNetEvent('murtaza:clean')
AddEventHandler('murtaza:clean', function()
  local playerPed = GetPlayerPed(-1)
  if IsPedInAnyVehicle(playerPed, false) then
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    SetVehicleDirtLevel(vehicle, 0)
  end
end)

RegisterNetEvent("revive")
AddEventHandler("revive", function()
    SetEntityHealth(GetPlayerPed(-1), 200)
end)