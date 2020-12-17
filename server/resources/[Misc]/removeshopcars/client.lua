Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, -33.7, -1102.01, 26.42, true) < 1 then
			ClearAreaOfVehicles(-337, -1102.01, 26.42, 50.0, false, false, false, false, false)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, -2123.46, 3098.64, 32.83, true) < 350 then
			ClearAreaOfVehicles(-2123.46, 3098.64, 32.83, 400.0, false, false, false, false, false)
		end
	end
end)