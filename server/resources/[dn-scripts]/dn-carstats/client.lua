function round(num, numDecimalPlaces)
  local mult = 100^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end


Citizen.CreateThread( function()

	while true do
		Wait(0)
				local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped, false) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -45.455184936524,-1098.1796875,26.422344207764, true) <= 5 then

				local veh = GetVehiclePedIsIn(ped, false)
				local model = GetEntityModel(veh, false)
				local hash = GetHashKey(model)
				local none = "                "

				local details = "~r~Model: ~b~".. GetDisplayNameFromVehicleModel(model) .. none .. " ~r~Topfart: ~b~".. round(GetVehicleMaxSpeed(model) * 3.6,1) .. " KM/T" .. none .. " ~r~ Sæder: ~b~".. GetVehicleMaxNumberOfPassengers(veh) + 1
DrawRect(0.508, 0.94, 0.336, 0.126, 0, 0, 0, 150)
DrawAdvancedText(0.603, 0.903, 0.005, 0.0028, 0.4, "Detaljer om køretøjet", 0, 191, 255, 255, 6, 0)
DrawAdvancedText(0.6, 0.956, 0.009, 0.0028, 0.4, details, 255, 255, 255, 255, 6, 0)
end
end
end)
