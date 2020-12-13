vRP = Proxy.getInterface("vRP")


-- PLEASE DO NOT CHANGE
local vehPrice = nil
local modPrice = vehPrice

-- CAN BE CHANGES
local key = 38 -- E (SELL BUTTON >> https://docs.fivem.net/game-references/controls/)

-- SCRAP LOCATIONS
scrapyards = {
	{-440.9921875,-1698.4564208984,18.940183639526},
	{1091.9002685547,3588.9992675781,32.7793995513916},
	{-128.37242126465,6214.96484375,30.209449249268}
}





--------------------------------------------------------------------
      -- >> DRAWMARKER AND THINGS LIKE THAT FUNCTION
--------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for i = 1, #scrapyards do
			scrapCoords2 = scrapyards[i] --
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), scrapCoords2[1], scrapCoords2[2], scrapCoords2[3], true ) < 40 then
	   			if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					DrawMarker(27, scrapCoords2[1], scrapCoords2[2], scrapCoords2[3], 0, 0, 0, 0, 0, 0, 5.75, 5.75, 5.75, 53, 146, 0, 100, 0, 0, 0, 50)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), scrapCoords2[1], scrapCoords2[2], scrapCoords2[3], true ) < 3 then
						vehSR_drawTxt("Tryk ~g~E~s~ for at skrotte køretøjet",0,1,0.5,0.95,0.6,255,255,255,255)
						if IsControlJustPressed(1, key) then
							local veh = GetVehiclePedIsUsing(GetPlayerPed(-1), false)
            						if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1)) then
								local vehicle1 = GetVehiclePedIsIn(GetPlayerPed(-1), false)
								local plate1 = GetVehicleNumberPlateText(vehicle1)
								if string.sub(plate1, 1, 8) == "P " .. vRP.getRegistrationNumber({}) then
									TriggerEvent("pNotify:SendNotification",{text = "Du kan ikke skrotte dit eget køretøj!",type = "error",timeout = (1500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
								else
									if vehPrice ~= nil then
										local health = GetEntityHealth(GetVehiclePedIsIn(GetPlayerPed(-1)))
										local modifier = health/1000
										modPrice = round((modifier * vehPrice), 0)
									else
										local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
										local class = GetVehicleClass(vehicle)
										TriggerServerEvent("scrap:getVehPrice", class)
									end

									local vehicle = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(owner)), false)
									local plate = GetVehicleNumberPlateText(vehicle)
									if string.sub(plate, 1, 2) == "P " then
										TriggerServerEvent('scrap:Mechanic', "scrap:Success") -- PLAYER VEHICLE
				            				else
										TriggerServerEvent('scrap:Mechanic', "scrap:SuccessNPC") -- NPC VEHICLE
									end
							    	end
                            				else
								TriggerEvent("pNotify:SendNotification",{text = "Du skal sidde i køretøjet for at skrotte det!",type = "error",timeout = (1500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
							end
						end
					end
	   			end
	  		end
		end
  	end
end)

--------------------------------------------------------------------
--------------------------------------------------------------------




--------------------------------------------------------------------
      -- >> SELL FUNCTION
--------------------------------------------------------------------

RegisterNetEvent("scrap:SuccessNPC")
AddEventHandler("scrap:SuccessNPC", function() -- NPC VEHICLE
	TriggerEvent("pNotify:SendNotification",{text = "Du har skrottet køretøjer for 1000 DKK",type = "success",timeout = (3500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	TriggerServerEvent("scrap:SellVehicle", 1000)
	local vehicle = SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1)), true, true)
	DeleteEntity(vehicle)
end)

RegisterNetEvent("scrap:Success")
AddEventHandler("scrap:Success", function() -- PLAYER VEHICLE
	if vehPrice == nil then
		TriggerEvent("pNotify:SendNotification",{text = "Du kan ikke sælge dette køretøj!",type = "success",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	else
		TriggerEvent("pNotify:SendNotification",{text = "Du har skrottet kørerøjet og modtager "..modPrice.." DKK",type = "success",timeout = (3500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		TriggerServerEvent("scrap:SellVehicle", modPrice)
		local vehicle = SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1)), true, true)
		DeleteEntity(vehicle)
		vehPrice = nil
	end
end)

RegisterNetEvent("setVehPrice")
AddEventHandler("setVehPrice", function(price)
	vehPrice = price
end)

--------------------------------------------------------------------
--------------------------------------------------------------------




--------------------------------------------------------------------
      -- >> BLIPS
--------------------------------------------------------------------

Citizen.CreateThread(function()
	local loadedBlip = false

	while true do
		Citizen.Wait(0)
		local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))

		--load blip
		if not loadedBlip then
		  for i = 1, #scrapyards do
			garageCoords = scrapyards[i]
			stationBlip = AddBlipForCoord(garageCoords[1], garageCoords[2], garageCoords[3])
			SetBlipSprite(stationBlip, 467)
			SetBlipDisplay(stationBlip, 2)
			SetBlipScale(stationBlip, 0.6)
			SetBlipColour(stationBlip, 69)
			SetBlipScale(blip,0.6)
			SetBlipAlpha(stationBlip, 255)
			SetBlipAsShortRange(stationBlip, true)
			BeginTextCommandSetBlipName("String")
			AddTextComponentString("Skrotplads")
			EndTextCommandSetBlipName(stationBlip)
			loadedBlip = true
          end
         end
		end
	  end)

--------------------------------------------------------------------
--------------------------------------------------------------------




--------------------------------------------------------------------
      -- >> DRAW FUNCTION
--------------------------------------------------------------------

function vehSR_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(6)
	SetTextProportional(6)
	SetTextScale(scale/1.0, scale/1.0)
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

--------------------------------------------------------------------
--------------------------------------------------------------------




--------------------------------------------------------------------
      -- >> ROUND
--------------------------------------------------------------------

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

--------------------------------------------------------------------
--------------------------------------------------------------------
