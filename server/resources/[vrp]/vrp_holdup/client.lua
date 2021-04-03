local holdingup = false
local store = ""
local secondsRemaining = 0

function holdup_DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function holdup_drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

local stores = cfg.holdups

RegisterNetEvent('vrp_holdup:currentlyrobbing')
AddEventHandler('vrp_holdup:currentlyrobbing', function(robb)
	holdingup = true
	store = robb
	secondsRemaining = cfg.seconds
end)

RegisterNetEvent('vrp_holdup:toofarlocal')
AddEventHandler('vrp_holdup:toofarlocal', function(robb)
	holdingup = false
	TriggerEvent("pNotify:SendNotification",{text = "Røveriet blev afbrudt, du modtog <b style='color:#ff0000'>intet</b>.",type = "warning",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	robbingName = ""
	secondsRemaining = 0
end)

RegisterNetEvent('vrp_holdup:playerdiedlocal')
AddEventHandler('vrp_holdup:playerdiedlocal', function(robb)
	holdingup = false
	TriggerEvent("pNotify:SendNotification",{text = "<b style='color:#ff0000'>Du døde! Røveriet blev afbrudt</b>.",type = "warning",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	robbingName = ""
	secondsRemaining = 0
end)

RegisterNetEvent('vrp_holdup:han:kan:ikke:fucking:rp')
AddEventHandler('vrp_holdup:han:kan:ikke:fucking:rp', function(robb)
	holdingup = false
	robbingName = ""
	secondsRemaining = 0
end)

RegisterNetEvent('vrp_holdup:robberycomplete')
AddEventHandler('vrp_holdup:robberycomplete', function(reward)
	holdingup = false
	TriggerEvent("pNotify:SendNotification",{text = "Røveriet blev gennemført, du modtog <b style='color:#3db1ff'>"..reward.."</b> DKK",type = "success",timeout = (3000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	store = ""
	secondsRemaining = 0
end)

Citizen.CreateThread(function()
	while true do
		if holdingup then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		for k,v in pairs(stores)do
			local pos2 = v.position
			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if IsPlayerWantedLevelGreater(PlayerId(),0) or ArePlayerFlashingStarsAboutToDrop(PlayerId()) then
					local wanted = GetPlayerWantedLevel(PlayerId())
					Citizen.Wait(5000)
					SetPlayerWantedLevel(PlayerId(), wanted, 0)
					SetPlayerWantedLevelNow(PlayerId(), 0)
				end
			end
		end
		Citizen.Wait(0)
	end
end)

if cfg.blips then -- blip settings
  Citizen.CreateThread(function()
	for k,v in pairs(stores)do
		local ve = v.position
		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 52)
		SetBlipScale(blip, 0.6)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Robbable Store")
		EndTextCommandSetBlipName(blip)
	end
  end)
end

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		for k,v in pairs(stores)do
			local pos2 = v.position
			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 3.0) then
				if not holdingup then
					DrawMarker(27, v.position.x, v.position.y, v.position.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
					drawTxt('[~g~E~s~] for at røve butikken', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
					
					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 2.0) then
						if(IsControlJustReleased(1, 51))then
							TriggerServerEvent('vrp_holdup:rob', k, pos.x, pos.y, pos.z)
						end
					end
				end
			end
		end
		if holdingup then
		    SetPlayerWantedLevel(PlayerId(), 2, 0)
            SetPlayerWantedLevelNow(PlayerId(), 0)
			holdup_drawTxt(0.69, 1.465, 1.0,1.0,0.4, "~r~" .. secondsRemaining .. "~w~ sekunder tilbage", 255, 255, 255, 255)	
			local pos2 = stores[store].position
			local ped = GetPlayerPed(-1)
            if IsEntityDead(ped) then
			TriggerServerEvent('vrp_holdup:playerdied', store)
			elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 15)then
			TriggerServerEvent('vrp_holdup:toofar', store)
			end
		end
		Citizen.Wait(0)
	end
end)