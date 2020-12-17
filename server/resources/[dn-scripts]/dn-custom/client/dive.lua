vRP = Proxy.getInterface("vRP")

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterNetEvent("dive:water")
AddEventHandler('dive:water', function()
	local ped = PlayerPedId()
	if IsEntityInWater(ped) then
		TriggerServerEvent('dive:gear')		
	else
		TriggerEvent("pNotify:SendNotification",{text = "Du skal være i vandet før du kan tage dykker dragt på.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  	  
	end
end)


RegisterNetEvent('cn:dykkerdragt') -- Tag dykkerdragt på
AddEventHandler('cn:dykkerdragt', function()
	local ped = PlayerPedId()
	if not vRP.isHandcuffed() then
		loadAnimDict("clothingtie")
		TaskPlayAnim(ped, "clothingtie", "try_tie_positive_a", 5.0, 5.0, -1, 48, 0, 0, 0, 0)	
	end
		Citizen.Wait(3000)
	    SetPedComponentVariation(ped, 8, 0, 240, 0) -- undertrøje
		if(GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
	        SetPedComponentVariation(ped, 11, 251, 17, 2) -- dykkerdragt top på kvinde
	        SetPedComponentVariation(ped, 8, 153, 0, 2) -- dykkertank kvinde
	        SetPedComponentVariation(ped, 4, 97, 17, 2) -- dykkerdragt bund på kvinde
	        SetPedComponentVariation(ped, 6, 70, 17, 2) -- svømmefødder på kvinde
	        SetPedComponentVariation(ped, 3, 18, 0, 2) -- arme på kvinde
			SetPedPropIndex(GetPlayerPed(-1), 1, 28, 17, 2) -- dykkerbriller
	    else
	        SetPedComponentVariation(ped, 11, 243, 17, 2) -- dykkerdragt top på mand
	        SetPedComponentVariation(ped, 8, 123, 0, 2) -- dykkertank mand
	        SetPedComponentVariation(ped, 4, 94, 17, 2) -- dykkerdragt bund på mand
	        SetPedComponentVariation(ped, 6, 67, 17, 2) -- svømmefødder på mand
	        SetPedComponentVariation(ped, 3, 17, 0, 2) -- arme på mand
			SetPedPropIndex(GetPlayerPed(-1), 1, 26, 17, 2) -- dykkerbriller
	    end
	TriggerEvent("pNotify:SendNotification",{text = "Du tog dykkerdragten på.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end

dive = false

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		local get_ped = GetPlayerPed(-1) -- current ped

		if dive == false then 
			SetPedMaxTimeUnderwater(GetPlayerPed(-1),22.0) 
		else
			-- test
		end
		if IsPedSwimmingUnderWater(GetPlayerPed(-1)) then
			breath = GetPlayerUnderwaterTimeRemaining(PlayerId())
			breathrounded = math.floor(breath * 10) / 10
			if breathrounded <= 0 then
				drawTxt(0.6785,1.463,1.0,1.0,0.45,"~r~Du er ved at drukne!",255,255,255,255)
			else
				if breathrounded <= 6 then
					drawTxt(0.6785,1.463,1.0,1.0,0.45,"~r~"..breathrounded.. " sekunder tilbage under vandet",255,255,255,240)
				elseif breathrounded > 6 and breathrounded < 12 then
					drawTxt(0.6785,1.463,1.0,1.0,0.45,"~y~"..breathrounded.. " sekunder tilbage under vandet",255,255,255,240)
				else
					drawTxt(0.6785,1.463,1.0,1.0,0.45,"~w~"..breathrounded.. " sekunder tilbage under vandet",255,255,255,150)
				end
			end
		end
	end
end)