vRPdv = {}
Tunnel.bindInterface("vrp_trucker",vRPdv)
Proxy.addInterface("vrp_trucker",vRPdv)
PMserver = Tunnel.getInterface("vrp_trucker","vrp_trucker")
vRPserver = Tunnel.getInterface("vRP","vrp_trucker")
vRP = Proxy.getInterface("vRP")

function LocalPed()
	return GetPlayerPed(-1)
end

local visits = 1
local l = 0
local area = 0
local onjob = false

local destinations = {
	-- Tur 1 - Centrum
	{ x = 204.7116394043, y = -1468.6324462891, z = 29.175458908081, money = 6750},		-- 01
	{ x = -342.64468383789, y = -1520.2106933594, z = 27.73931312561, money = 6750},	-- 02
	{ x = -423.79290771484, y = -1682.6442871094, z = 19.02908706665, money = 6750},	-- 03
	{ x = -557.14794921875, y = -1795.83203125, z = 22.534662246704, money = 6750},		-- 04
	{ x = -591.26385498047, y = -1586.2965087891, z = 26.751129150391, money = 6750},	-- 05
	{ x = -1606.1414794922, y = -822.64617919922, z = 10.030209541321, money = 6750},	-- 06
	{ x = 351.21160888672, y = 359.32824707031, z = 104.98268127441, money = 6750},		-- 07
	{ x = 820.22131347656, y = -823.32263183594, z = 26.181079864502, money = 6750},	-- 08
	{ x = 743.37872314453, y = -948.08508300781, z = 25.632595062256, money = 6750},	-- 09
	{ x = 756.79553222656, y = -1404.0626220703, z = 26.539621353149, money = 6750},	-- 10
	{ x = 916.64868164063, y = -1265.1588134766, z = 25.560796737671, money = 6750},	-- 11
	{ x = 729.01220703125, y = -1362.875, z = 26.367321014404, money = 6750},			-- 12
	{ x = 917.80407714844, y = -1725.798828125, z = 32.159622192383, money = 6750},		-- 13
	{ x = 837.92199707031, y = -1930.5609130859, z = 28.972574234009, money = 6750},	-- 14
	{ x = 1091.9057617188, y = -1976.7751464844, z = 31.014654159546, money = 6750},	-- 15
	{ x = 1412.3955078125, y = -2055.2824707031, z = 51.998527526855, money = 6750},	-- 16
	{ x = 1703.5185546875, y = -1501.6329345703, z = 112.96327972412, money = 6750},	-- 17
	{ x = 1009.3629760742, y = -2528.2368164063, z = 28.304943084717, money = 6750},	-- 18
	{ x = 141.72885131836, y = -1082.2766113281, z = 29.192733764648, money = 6750},	-- 19
	{ x = -1321.9017333984, y = -238.33583068848, z = 42.602527618408, money = 6750},	-- 20
	{ x = 1141.9255371094, y = -299.61315917969, z = 68.800666809082, money = 6750},	-- 21
	{ x = 985.42633056641, y = -1535.6002197266, z = 30.717967987061, money = 6750},	-- 22
	{ x = 105.84467315674, y = -1815.7540283203, z = 26.533123016357, money = 6750},	-- 23
	{ x = 448.88381958008, y = -1495.2761230469, z = 29.29203414917, money = 6750},		-- 24
	{ x = 70.176864624023, y = -1427.4643554688, z = 29.31164932251, money = 6750},		-- 25
	{ x = -147.44314575195, y = -1421.2015380859, z = 30.839357376099, money = 6750},	-- 26
	{ x = -770.08551025391, y = -2606.7712402344, z = 13.844507217407, money = 6750},	-- 27
	{ x = -688.23504638672, y = -2455.4248046875, z = 13.894716262817, money = 6750},	-- 28
	{ x =-656.95544433594, y = -676.4482421875, z = 31.593715667725, money = 6750},		-- 29
	{ x = 289.55688476563, y = -962.63720703125, z = 29.418628692627, money = 6750},	-- 30
	-- Tur 2 - Sandy og omegn
	{ x = 354.03771972656, y = 3562.8286132813, z = 33.566158294678, money = 5650},		-- 31
	{ x = 329.22506713867, y = 3409.7409667969, z = 36.695373535156, money = 5650},		-- 32
	{ x = 890.57141113281, y = 3658.8586425781, z = 32.821979522705, money = 5650},		-- 33
	{ x = 1535.5308837891, y = 3768.9294433594, z = 34.050048828125, money = 5650},		-- 34
	{ x = 1979.1873779297, y = 3777.2619628906, z = 32.181365966797, money = 5650},		-- 35
	{ x = 2127.66015625, y = 4795.8125, z = 41.141052246094, money = 5650},				-- 36
	{ x = 1711.5966796875, y = 4804.7958984375, z = 41.786823272705, money = 5650},		-- 37
	{ x = 1690.9079589844, y = 4916.5415039063, z = 42.078098297119, money = 5650},		-- 38
	{ x = 2411.2390136719, y = 4988.669921875, z = 46.242290496826, money = 5650},		-- 39
	{ x = 2884.1650390625, y = 4474.1713867188, z = 48.094005584717, money = 5650},		-- 40
	{ x = 2892.7702636719, y = 4380.5200195313, z = 50.349060058594, money = 5650},		-- 41
	{ x = 2666.4211425781, y = 3519.6047363281, z = 52.708805084229, money = 5650},		-- 42
	{ x = 2655.6948242188, y = 3278.6430664063, z = 55.24193572998, money = 5650},		-- 43
	{ x = 2047.9119873047, y = 3183.4255371094, z = 45.033744812012, money = 5650},		-- 44
	{ x = 1998.2380371094, y = 3059.0131835938, z = 47.049133300781, money = 5650},		-- 45
	{ x = 1738.2515869141, y = 3288.767578125, z = 41.141860961914, money = 5650},		-- 46
	{ x = 1059.4296875, y = 2659.6040039063, z = 39.557662963867, money = 5650},		-- 47
	{ x = 651.37420654297, y = 2765.0070800781, z = 41.947162628174, money = 5650},		-- 48
	{ x = 1845.4649658203, y = 2542.0256347656, z = 45.672012329102, money = 5650},		-- 49
	{ x = 1859.1840820313, y = 2708.9343261719, z = 45.950305938721, money = 5650},		-- 50
	-- Tur 3 Paleto bay
	{ x = -775.66528320313, y = 5578.43359375, z = 33.485679626465, money = 4350},		-- 51
	{ x = -815.38537597656, y = 5417.3359375, z = 34.111793518066, money = 4350},		-- 52
	{ x = -593.92315673828, y = 5298.888671875, z = 70.214401245117, money = 4350},		-- 53
	{ x = -692.54107666016, y = 5774.4111328125, z = 17.330968856812, money = 4350},	-- 54
	{ x = -440.82055664063, y = 6143.3032226563, z = 31.478328704834, money = 4350},	-- 55
	{ x = -361.04962158203, y = 6070.7534179688, z = 31.498706817627, money = 4350},	-- 56
	{ x = -257.54354858398, y = 6070.892578125, z = 31.464595794678, money = 4350},		-- 57
	{ x = -120.37158966064, y = 6212.7797851563, z = 31.201044082642, money = 4350},	-- 58
	{ x = 48.148452758789, y = 6294.095703125, z = 31.266702651978, money = 4350},		-- 59
	{ x = 43.781177520752, y = 6451.8115234375, z = 31.421125411987, money = 4350},		-- 60
	{ x = -227.12892150879, y = 6248.9599609375, z = 31.444662094116, money = 4350},	-- 61
	{ x = -81.904808044434, y = 6495.6630859375, z = 31.490911483765, money = 4350},	-- 62
	{ x = 67.582084655762, y = 6546.9301757813, z = 31.407470703125, money = 4350},		-- 63
	{ x = 423.22561645508, y = 6513.4799804688, z = 27.658636750488, money = 4350},		-- 64
	{ x = 1689.6591796875, y = 6427.3286132813, z = 32.490634918213, money = 4350},		-- 65
	{ x = -516.84155273438, y = 5242.9946289063, z = 80.156875610352, money = 4350}		-- 66
}

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

RegisterNetEvent("notrucker")
AddEventHandler("notrucker", function()
	TriggerEvent("pNotify:SendNotification",{text = "Du er ikke lastbilchauffør",type = "error",timeout = (5000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end)

RegisterNetEvent("yestrucker")
AddEventHandler("yestrucker", function()
	SpawnVan()
	TriggerEvent("pNotify:SendNotification",{text = "God arbejdslyst!",type = "success",timeout = (5000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end)

RegisterNetEvent("notruck")
AddEventHandler("notruck", function()
	SpawnVan()
	TriggerEvent("pNotify:SendNotification",{text = "Du skal være i din lastbil for at starte ruten!",type = "error",timeout = (5000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		DrawMarker(27, 153.298,6422.774,31.388 -1, 0, 0, 0, 0, 0, 0, 3.0001, 3.0001, 1.5001, 255, 165, 0,165, 0, 0, 0,50) --- The GoPostal depot location
		if GetDistanceBetweenCoords(153.298,6422.774,31.288, GetEntityCoords(LocalPed())) < 2.0 then
			basiccheck()
		end
		if onjob == true then
			if GetDistanceBetweenCoords(destinations[l].x,destinations[l].y,destinations[l].z - 1, GetEntityCoords(GetPlayerPed(-1))) < 3.0 then
				if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("packer")) or IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("phantom")) or IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("phantom3")) then
					drawTxt('[~g~E~s~] for at aflevere dine ~b~varer', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
					if (IsControlJustReleased(1, 38)) then
						truckersucces()
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetDistanceBetweenCoords(153.298,6422.774,31.388, GetEntityCoords(LocalPed())) < 2.0 then
			canceljob()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if onjob == true then
			DrawMarker(27,destinations[l].x,destinations[l].y,destinations[l].z -0.8, 0, 0, 0, 0, 0, 0, 3.0001, 3.0001, 1.5001, 255, 165, 0,165, 0, 0, 0,50)
		end
	end
end)

function canceljob()
	if onjob == true then
		if (IsInVehicle()) then
			if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("packer")) or IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("phantom")) or IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("phantom3")) then
				drawTxt('[~g~H~s~] for at afslutte din ~b~rute', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
				if (IsControlJustReleased(1, 74)) then
					onjob = false
					RemoveBlip(deliveryblip)
					local vehicle = GetPlayersLastVehicle()
					if DoesEntityExist(vehicle) then
						DeleteEntity(vehicle)
					end
				end
			end
		end
	end
end

function basiccheck()
	if onjob == false then
		if (IsInVehicle()) then
			if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("packer")) or IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("phantom")) or IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("phantom3")) then
				drawTxt('[~g~E~s~] for at modtage~b~ din trailer', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
				if (IsControlJustReleased(1, 38)) then
					TriggerServerEvent('trucker:checkjob')
				end
			else
				drawTxt('[~g~E~s~] for at starte din ~b~rute ', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
				if (IsControlJustReleased(1, 38)) then
					TriggerEvent('notruck')
				end
			end
		else
			drawTxt('[~g~E~s~] for at starte din ~b~rute', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
			if (IsControlJustReleased(1, 38)) then
				TriggerEvent('notruck')
			end
		end
	else
	end
end

function SpawnVan()
	if (IsInVehicle()) then
		if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("packer")) or IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("phantom")) or IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("phantom3")) then
			area = 0
			Citizen.Wait(0)
			local myPed = GetPlayerPed(-1)
			local player = PlayerId()
			local vehicle = GetHashKey('trailers2')

			RequestModel(vehicle)

			while not HasModelLoaded(vehicle) do
				Wait(1)
			end

			local y = 6415.111328125+math.random()*15.5*2

			local plate = math.random(100, 900)
			local spawned_car = CreateVehicle(vehicle, 136.8343963623,y,31.286876678467,234.72848510742, true, false)
			SetVehicleOnGroundProperly(spawned_car)
			SetVehicleNumberPlateText(spawned_car, "DK"..plate)
			SetModelAsNoLongerNeeded(vehicle)
			Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
			startjob()
		end
	end
end

function IsInVehicle()
	local ply = GetPlayerPed(-1)
	if IsPedSittingInAnyVehicle(ply) then
		return true
	else
		return false
	end
end

function startjob()

	TriggerEvent("pNotify:SendNotification",{text = "Kør til den angivne destination",type = "success",timeout = (5000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	onjob = true
	-- If area isnt set, then set it. Area will be reset when truckersucces() is called.

	area = math.random(1,3)
	if area == 1 then
		l = math.random(1,30)
	end
	if area == 2 then
		l = math.random(31,50)
	end
	if area == 3 then
		l = math.random(51,66)
	end

	deliveryblip = (AddBlipForCoord(destinations[l].x,destinations[l].y,destinations[l].z))
	SetBlipSprite(deliveryblip, 280)
	SetBlipRoute(deliveryblip,  true)
end

function truckersucces()
	TriggerServerEvent('trucker:success',destinations[l].money)
	if visits == 5 then --change 5 to however many runs you want a person to be able to make before having to return to the depot
		RemoveBlip(deliveryblip)
		onjob = false
		visits = 1
		area = 0
		TriggerEvent("pNotify:SendNotification",{text = "Vend tilbage til en lastbilcentral for at hente en ny trailer!",type = "success",timeout = (5000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		-- SetNewWaypoint(1157.236, -3272.024)
	else
		RemoveBlip(deliveryblip)
		startjob()
		visits = visits + 1
	end
end

-- not very clean but i took it from my blip script in wich there are more
--Did not test this part in this script, so if it somehow does not work delete the part below and make your own blip :)
local blips = {
	{title="Lastbil vogne", colour=18, id=479, x=136.1911, y=6431.2280, z=31.355},
}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.6)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end)