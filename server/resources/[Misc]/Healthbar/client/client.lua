local thirst = 0
local hunger = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        TriggerServerEvent("vRP_HealthUI:getData")

        SendNUIMessage({
            show = IsPauseMenuActive(),
            health = GetEntityHealth(GetPlayerPed(-1)) - 100,
            armor = GetPedArmour(GetPlayerPed(-1)),
            stamina = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
            hunger = hunger,
            thirst = thirst,
            healthtext = cfg.healthtext,
            armortext = cfg.armortext,
            deadtext = cfg.deadtext
        })
    end
end)

RegisterNetEvent("vRP_HealthUI:returnBasics")
AddEventHandler("vRP_HealthUI:returnBasics", function (rHunger, rThirst)
    hunger = rHunger
    thirst = rThirst
end)

-- Voice
local voice = {default = 5.0, shout = 12.0, whisper = 1.0, current = 0, level = nil}

AddEventHandler('onClientMapStart', function()
	if voice.current == 0 then
		NetworkSetTalkerProximity(voice.default)
		SendNUIMessage({
     		voicelvl = 52
     	});
	elseif voice.current == 1 then
		NetworkSetTalkerProximity(voice.shout)
		SendNUIMessage({
     		voicelvl = 100
     	});
	elseif voice.current == 2 then
		NetworkSetTalkerProximity(voice.whisper)
		SendNUIMessage({
     		voicelvl = 25
     	});
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		if IsControlJustPressed(1, 10) then -- Page UP
			voice.current = (voice.current + 1) % 3
			if voice.current == 0 then
				NetworkSetTalkerProximity(voice.default)
				SendNUIMessage({
					voicelvl = 52
				});
			elseif voice.current == 1 then
				NetworkSetTalkerProximity(voice.shout)
				SendNUIMessage({
					voicelvl = 100
				});
			elseif voice.current == 2 then
				NetworkSetTalkerProximity(voice.whisper)				
				SendNUIMessage({
					voicelvl = 25
				});
			end
		end

		if voice.current == 0 then
			SendNUIMessage({
				voicelvl = 52
			});
		elseif voice.current == 1 then
			SendNUIMessage({
				voicelvl = 100
			});
		elseif voice.current == 2 then
			SendNUIMessage({
				voicelvl = 25
			});
		end
		if NetworkIsPlayerTalking(PlayerId()) then
			SendNUIMessage({talking = true})

		elseif not NetworkIsPlayerTalking(PlayerId()) then
			SendNUIMessage({talking = false})
		end
	end
end)