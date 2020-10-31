
local zones = { 

	{ ['x'] = 1641.78, ['y'] = 2641.07, ['z'] = 32.65}
}


Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(100)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		for i = 1, #zones, 1 do
			dist = Vdist(zones[i].x, zones[i].y, zones[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		Citizen.Wait(100)
	end
end)


Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
	
		Citizen.Wait(100)
	end
	
	while true do
		Citizen.Wait(100)
		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local veh = GetVehiclePedIsUsing(ped)
		local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)
		     
	
		if dist <= 250.0 then  
			if not jailOut then	
				SetPlayerInvincible(GetPlayerIndex(),true)
				SetEntityHealth(player, 2000)
			end
		else
			if not jailIn then
				SetPlayerInvincible(GetPlayerIndex(),false)	
			end
	 	end
	end
end)






   