
-- DrawMarker funktion original from: https://forum.fivem.net/t/release-vrp-scrap-system/167010

-- The unlock funktion: Made by RedYodaDK

vRP = Proxy.getInterface("vRP")

-- CAN BE CHANGES
local key = 38 -- E (Unlock BUTTON >> https://docs.fivem.net/game-references/controls/)

-- SCRAP LOCATIONS
Unlockpoints = {
	{1228.1469726563,2742.337890625,37.105340576172},
	{-56.670337677002,-2520.1564941406,6.5011688232422},
	{2526.345703125,4990.0068359375,43.86118850708}
}



--------------------------------------------------------------------
      -- >> DRAWMARKER AND THINGS LIKE THAT FUNCTION
--------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for i = 1, #Unlockpoints do
			unlockcoords = Unlockpoints[i] --
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), unlockcoords[1], unlockcoords[2], unlockcoords[3], true ) < 10 then
					DrawMarker(27, unlockcoords[1], unlockcoords[2], unlockcoords[3], 0, 0, 0, 0, 0, 0, 0.75, 0.75, 5.75, 200, 0, 0, 100, 0, 0, 0, 1)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), unlockcoords[1], unlockcoords[2], unlockcoords[3], true ) < 2 then
					 DrawText3Ds(unlockcoords[1], unlockcoords[2], unlockcoords[3], "Klik ~g~E~w~ for at få dirket håndjern op.")
						if IsControlJustPressed(1, key) then

							local user_id = vRP.getUserId(source)

							if vRP.isHandcuffed(user_id) then
							vRP.toggleHandcuff(user_id,{})
								TriggerEvent("pNotify:SendNotification",{text = "Du har fået dirket dine håndjern op!",type = "info",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
							else
							TriggerEvent("pNotify:SendNotification",{text = "Du er ikke i håndjern!",type = "info",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
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
      -- >> DRAW FUNCTION
--------------------------------------------------------------------

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

--------------------------------------------------------------------
--------------------------------------------------------------------