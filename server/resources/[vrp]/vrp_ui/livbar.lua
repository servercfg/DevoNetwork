Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		health = GetEntityHealth(GetPlayerPed(-1))
		healthV = math.clamp((health-120)/80, 0, 1)
		healthX = math.clamp(0.015 + (0.0703*healthV), 0, 0.1407)

		DrawRect(0.0853, 0.976, 0.1406, 0.011, 128, 128, 128, 128, 255)
		local healthP = math.ceil(((health-120)/80) * 100)

		if healthP > 50 then
			DrawRect(healthX, 0.976,0.0703*healthV*2,0.011,78,147,80, 255)
		elseif healthP <= 50 and healthP > 25  then
			DrawRect(healthX, 0.976,0.0703*healthV*2,0.011,255, 255, 0, 255)
		else
			DrawRect(healthX, 0.976,0.0703*healthV*2,0.011,255, 0, 0, 255)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		health = GetEntityHealth(GetPlayerPed(-1))
		healthV = math.clamp((health-120)/80, 0, 1)
		healthX = math.clamp(0 + (200*healthV)/2, 0, 100)

		if health then
			drawTxt(0.580, 1.461, 1.0,1.0,0.26, math.ceil(healthX), 255, 255, 255, 255)
		end
	end
end)



