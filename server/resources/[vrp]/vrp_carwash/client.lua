local Rotation = 0
Key = 201 -- ENTER

vehicleWashStation = {
	{26.5906,  -1392.0261,  29.6634},
	{167.1034,  -1719.4704,  27.2916},
	{-74.5693,  6427.8715,  29.4400},
	{-699.6325,  -932.7043,  17.0139},
	{11.502053260803,-1824.0516357422,23.035074234009}
}

vRP = Proxy.getInterface("vRP")

Citizen.CreateThread(function ()
	Citizen.Wait(0)
	for i = 1, #vehicleWashStation do
		garageCoords = vehicleWashStation[i]
		stationBlip = AddBlipForCoord(garageCoords[1], garageCoords[2], garageCoords[3])
		SetBlipSprite(stationBlip, 100) -- 100 = carwash
		SetBlipAsShortRange(stationBlip, true)
		SetBlipScale(stationBlip,0.6)
	end
    return
end)

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
			for i = 1, #vehicleWashStation do
				garageCoords2 = vehicleWashStation[i]
                Rotation = Rotation - 0.5		
				if Rotation <= 0 then
					Rotation = 360
			    end
				DrawMarker(36, garageCoords2[1], garageCoords2[2], garageCoords2[3], 0, 0, 0, 0, 0, Rotation, 5.0, 5.0, 2.0, 0, 157, 0, 155, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) < 5 then
					DrawSpecialText("Tryk [~g~ENTER~s~] for at vaske dit køretøj!!")
					if(IsControlJustPressed(1, Key)) then
						TriggerServerEvent('carwash:checkmoney', GetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),false)))
					end
				end
			end
		end
	end
end)

RegisterNetEvent('carwash:success')
AddEventHandler('carwash:success', function()
	SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),false), 0.0)
	SetVehicleUndriveable(GetVehiclePedIsIn(GetPlayerPed(-1),false), false)
	TriggerEvent("pNotify:SendNotification", {text = "Betalte 145 DKK", type = "info", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
end)
RegisterNetEvent('carwash:notenough')
AddEventHandler('carwash:notenough', function()
	TriggerEvent("pNotify:SendNotification", {text = "Ikke nok penge!", type = "warning", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
end)
RegisterNetEvent('carwash:alreadyclean')
AddEventHandler('carwash:alreadyclean', function()
	TriggerEvent("pNotify:SendNotification", {text = "Du behøves ikke at vaske køretøjet flere gange!", type = "warning", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
end)