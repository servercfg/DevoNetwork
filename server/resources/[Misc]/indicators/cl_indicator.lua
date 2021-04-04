local IndicatorL = false
local IndicatorR = false
local IndicatorB = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsControlJustPressed(1, 174) then -- left
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				TriggerEvent('Indicator', 'left')
			end
		end
		if IsControlJustPressed(1, 175) then --right
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				TriggerEvent('Indicator', 'right')
			end
		end
		if IsControlJustPressed(1, 173) then --right
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				TriggerEvent('Indicator', 'both')
			end
		end
    end
end)

AddEventHandler('Indicator', function(dir)
	Citizen.CreateThread(function()
		local Ped = GetPlayerPed(-1)
		if IsPedInAnyVehicle(Ped, true) then
			local Veh = GetVehiclePedIsIn(Ped, false)
			if GetPedInVehicleSeat(Veh, -1) == Ped then
				if dir == 'left' then
					IndicatorL = not IndicatorL
					TriggerServerEvent('IndicatorL', IndicatorL)
				elseif dir == 'right' then
					IndicatorR = not IndicatorR
					TriggerServerEvent('IndicatorR', IndicatorR)
				elseif dir == 'both' then
					IndicatorB = not IndicatorB
					TriggerServerEvent('IndicatorB', IndicatorB)
				end
			end
		end
	end)
end)

RegisterNetEvent('updateIndicators')
AddEventHandler('updateIndicators', function(PID, dir, Toggle)
	--if isPlayerOnline(PID) then
		local Veh = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(PID)), false)
		if dir == 'left' then
			SetVehicleIndicatorLights(Veh, 1, Toggle)
			SetVehicleIndicatorLights(Veh, 0, false)
		elseif dir == 'right' then
			SetVehicleIndicatorLights(Veh, 0, Toggle)
			SetVehicleIndicatorLights(Veh, 1, false)
		elseif dir == 'both' then
			SetVehicleIndicatorLights(Veh, 0, Toggle)
			SetVehicleIndicatorLights(Veh, 1, Toggle)
		end
	--end
end)