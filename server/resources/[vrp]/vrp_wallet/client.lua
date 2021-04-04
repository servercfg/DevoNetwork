RegisterNetEvent("vrp_wallet:setValues")
AddEventHandler("vrp_wallet:setValues", function(wallet, bank)
	SendNUIMessage({
		wallet = wallet,
		bank = bank
	})	
end)

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(0)
        
        if IsControlJustPressed(1, 244) then
		TriggerServerEvent('vrp_wallet:getMoneys')
		SendNUIMessage({
			control = 'm'
		})
        end
    end
end)
