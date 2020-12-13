vRP = Proxy.getInterface("vRP")
vRPex = Proxy.getInterface("vrp_extended")

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

function ply_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
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
	DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 20, 20, 20, 150)
end

local doctorped = ""
RegisterNetEvent("vrp_hospital:place")
AddEventHandler("vrp_hospital:place", function()
	RequestModel(GetHashKey("s_m_m_doctor_01"))
	while not HasModelLoaded(GetHashKey("s_m_m_doctor_01")) do
		Wait(1)
	end
	doctorped =  CreatePed(4, 0xd47303ac, 308.35061645508,-595.54040527344,42.284004211426,67.5835838317871, false, true)
	SetEntityHeading(doctorped, 67.5835838317871)
	FreezeEntityPosition(doctorped, true)
	SetEntityInvincible(doctorped, true)
	SetBlockingOfNonTemporaryEvents(doctorped, true)
end)

local doctorped2 = ""
RegisterNetEvent("vrp_hospital:place")
AddEventHandler("vrp_hospital:place", function()
	RequestModel(GetHashKey("s_m_m_doctor_01"))
	while not HasModelLoaded(GetHashKey("s_m_m_doctor_01")) do
		Wait(1)
	end
	doctorped2 =  CreatePed(4, 0xd47303ac, -265.14895629883,6314.3110351563,31.436401367188,8.5835838317871, false, true)
	SetEntityHeading(doctorped2, 7.5027513504028)
	FreezeEntityPosition(doctorped2, true)
	SetEntityInvincible(doctorped2, true)
	SetBlockingOfNonTemporaryEvents(doctorped2, true)
end)

local checkedin = 0 -- sæt til false

local pause = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if pause ~= 0 then if pause > 0 then pause = pause-1 end end
		if checkedin == 0 then
			local coords = GetEntityCoords(PlayerPedId(),true)
			if (Vdist(coords["x"], coords["y"], coords["z"], 306.39999389648,-594.96350097656,42.291839599609) < 1.2) then
				if pause == 0 then
					DrawMarker(27, 306.39999389648,-594.96350097656,42.30, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5001, 83, 255, 87, 200, 0, 0, 0, 50)
					DrawText3Ds(306.39999389648,-594.96350097656,43.291839599609,"Tryk [~g~E~w~] for tjekke ind")
					if IsControlJustReleased(1, Keys["E"]) then
					exports['progressBars']:startUI(2500, "Tjekker ind")
						pause = 16000
						loadAnimDict("mp_common")
						TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
						TaskPlayAnim(doctorped, "mp_common", "givetake2_a", 8.0, 8.0, -1, 1, 0, false, false, false)
						Citizen.Wait(2500)
						ClearPedTasks(PlayerPedId())
						TaskStartScenarioInPlace(doctorped, "WORLD_HUMAN_CLIPBOARD")
						Citizen.Wait(10000)
						ClearPedTasks(doctorped)
							checkedin = 18000
						end
				end
			end
		else
			if inbed == false then
				if checkedin > 0 then
					checkedin = checkedin-1
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if pause ~= 0 then if pause > 0 then pause = pause-1 end end
		if checkedin == 0 then
			local coords = GetEntityCoords(PlayerPedId(),true)
			if (Vdist(coords["x"], coords["y"], coords["z"], -265.59854125977,6316.0234375,31.436408996582) < 1.2) then
				if pause == 0 then
					DrawMarker(27, -265.59854125977,6316.0234375,31.436408996582, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5001, 83, 255, 87, 200, 0, 0, 0, 50)
					DrawText3Ds(-265.59854125977,6316.0234375,32.436408996582,"Tryk [~g~E~w~] for tjekke ind")
					if IsControlJustReleased(1, Keys["E"]) then
					exports['progressBars']:startUI(2500, "Tjekker ind")
						pause = 16000
						loadAnimDict("mp_common")
						TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
						TaskPlayAnim(doctorped, "mp_common", "givetake2_a", 8.0, 8.0, -1, 1, 0, false, false, false)
						Citizen.Wait(2500)
						ClearPedTasks(PlayerPedId())
						TaskStartScenarioInPlace(doctorped2, "WORLD_HUMAN_CLIPBOARD")
						Citizen.Wait(10000)
						ClearPedTasks(doctorped2)
							checkedin = 18000
						end
				end
			end
		else
			if inbed == false then
				if checkedin > 0 then
					checkedin = checkedin-1
				end
			end
		end
	end
end)

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 5 )
	end
end

RegisterNetEvent('dn-hospital:load')
AddEventHandler('dn-hospital:load', function(list)
	usedbeds = list
end)

RegisterNetEvent('dn-hospital:status')
AddEventHandler('dn-hospital:status', function(key,bed)
	usedbeds[key] = bed
end)