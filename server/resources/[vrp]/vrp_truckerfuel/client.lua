vRPdv = {}
Tunnel.bindInterface("vrp_truckerfuel",vRPdv)
Proxy.addInterface("vrp_truckerfuel",vRPdv)
PMserver = Tunnel.getInterface("vrp_truckerfuel","vrp_truckerfuel")
vRPserver = Tunnel.getInterface("vRP","vrp_truckerfuel")
vRP = Proxy.getInterface("vRP")

function LocalPed()
	return GetPlayerPed(-1)
end

--Don't mess with these, changing stuff goes below
local visits = 1
local l = 0
local area = 0
local onjob = false

--these are all the delivery locations, sorted from close to GoPostal to far from it (so earn less for close runs, more for far ones)
local fueldestinations = {
-- Tur 1 - Centrum
{ x = -727.73504638672, y = -919.19720458984, z = 19.013967514038, money = 4250},	-- 01
{ x = 175.08856201172, y = -1562.5463867188, z = 29.266082763672, money = 4250},	-- 02
{ x = -65.428344726563, y = -2529.845703125, z = 6.0127272605896, money = 4250},	-- 03
{ x = -975.22766113281, y = -2867.3295898438, z = 13.949749946594, money = 4250},	-- 04
{ x = -1046.4914550781, y = -2421.3869628906, z = 13.944537162781, money = 4250},	-- 05
{ x = -1119.1048583984, y = -1975.62109375, z = 13.161705970764, money = 4250},		-- 06
{ x = -2084.34765625, y = -322.96759033203, z = 13.023704528809, money = 4250},		-- 07
{ x = -1435.9490966797, y = -277.35638427734, z = 46.207698822021, money = 4250},	-- 08
{ x = -526.07843017578, y = -1210.9447021484, z = 18.184833526611, money = 4250},	-- 09
{ x = -323.09295654297, y = -1475.3564453125, z = 30.548686981201, money = 4250},	-- 10
{ x = -550.49462890625, y = -1632.7426757813, z = 19.069334030151, money = 4250},	-- 11
{ x = -67.141616821289, y = -1765.0600585938, z = 29.246452331543, money = 4250},	-- 12
{ x = 260.75503540039, y = -1262.4141845703, z = 29.142892837524, money = 4250},	-- 13
{ x = 817.32281494141, y = -1590.5390625, z = 31.443590164185, money = 4250},		-- 14
{ x = 879.07135009766, y = -1732.1107177734, z = 30.042667388916, money = 4250},	-- 15
{ x = 851.13824462891, y = -2128.3212890625, z = 30.294382095337, money = 4250},	-- 16
{ x = 1012.2115478516, y = -2526.2321777344, z = 28.306871414185, money = 4250},	-- 17
{ x = 87.33373260498, y = -336.90625, z = 43.139213562012, money = 4250},			-- 18
{ x = 625.11309814453, y = 267.56497192383, z = 103.08937835693, money = 4250},		-- 19
{ x = 1071.5994873047, y = -794.70343017578, z = 58.308277130127, money = 4250},	-- 20
{ x = 1178.4183349609, y = -326.07202148438, z = 69.174354553223, money = 4250},	-- 21
{ x = 2457.1789550781, y = -434.87069702148, z = 92.993347167969, money = 4250},	-- 22
{ x = 1685.5750732422, y = -1456.5202636719, z = 112.21459197998, money = 4250},	-- 23
{ x = 1689.7438964844, y = -1538.9080810547, z = 112.76583862305, money = 4250},	-- 24
{ x = 1702.7298583984, y = -1584.3026123047, z = 112.53536987305, money = 4250},	-- 25
{ x = 1690.7581787109, y = -1634.4779052734, z = 112.44543457031, money = 4250},	-- 26
{ x = 1710.9820556641, y = -1707.3211669922, z = 112.41142272949, money = 4250},	-- 27
{ x = 1749.0262451172, y = -1496.3792724609, z = 112.8125, money = 4250},			-- 28
-- Tur 2 - Sandy og omegn
{ x = 1992.3226318359, y = 3760.8076171875, z = 32.180698394775, money = 5650},		-- 29
{ x = 1363.0743408203, y = 3592.2766113281, z = 34.917282104492, money = 5650},		-- 30
{ x = 1783.6268310547, y = 3329.4487304688, z = 41.259395599365, money = 5650},		-- 31
{ x = 1209.4708251953, y = 2662.8935546875, z = 37.809970855713, money = 5650},		-- 32
{ x = 1035.3952636719, y = 2677.1682128906, z = 39.532146453857, money = 5650},		-- 33
{ x = 263.75723266602, y = 2609.9965820313, z = 44.841480255127, money = 5650},		-- 34
{ x = 48.060695648193, y = 2776.7553710938, z = 57.884044647217, money = 5650},		-- 35
{ x = 2536.8388671875, y = 2593.6508789063, z = 37.944869995117, money = 5650},		-- 36
{ x = 1681.8865966797, y = 4933.4897460938, z = 42.076477050781, money = 5650},		-- 37
{ x = -2554.9099121094, y = 2330.6145019531, z = 33.060050964355, money = 5650},	-- 38
{ x = -3173.4807128906, y = 1121.2647705078, z = 20.91575050354, money = 5650},		-- 39
{ x = 2682.0986328125, y = 3263.2517089844, z = 55.240516662598, money = 5650},		-- 40
{ x = 1372.0502929688, y = 3621.3017578125, z = 34.879264831543, money = 5650},		-- 41
-- Tur 3 - Paleto Bay
{ x = 202.27198791504, y = 6616.2446289063, z = 31.684715270996, money = 6750},		-- 42
{ x = 1703.4954833984, y = 6420.2934570313, z = 32.637603759766, money = 6750},		-- 43
{ x = -94.773071289063, y = 6414.46875, z = 31.474168777466, money = 6750},			-- 44
{ x = 176.56538391113, y = 6602.35546875, z = 31.848789215088, money = 6750},		-- 45
{ x = 154.54302978516, y = 6627.193359375, z = 31.764404296875, money = 6750},		-- 46
{ x = 79.638313293457, y = 6343.7958984375, z = 31.375858306885, money = 6750},		-- 47
{ x = -261.71252441406, y = 6041.1889648438, z = 31.902864456177, money = 6750},	-- 48
{ x = 1685.5202636719, y = 6438.7060546875, z = 32.349376678467, money = 6750},		-- 49
{ x = 1456.4566650391, y = 6353.1577148438, z = 23.833074569702, money = 6750},		-- 50
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

RegisterNetEvent("notruckerfuel")
AddEventHandler("notruckerfuel", function()
	TriggerEvent("pNotify:SendNotification",{text = "Du er ikke lastbilchauffør",type = "error",timeout = (5000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end)

RegisterNetEvent("yestruckerfuel")
AddEventHandler("yestruckerfuel", function()
    SpawnVan()
	TriggerEvent("pNotify:SendNotification",{text = "God arbejdslyst!",type = "success",timeout = (5000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end)

RegisterNetEvent("notruckfuel")
AddEventHandler("notruckfuel", function()
    SpawnVan()
	TriggerEvent("pNotify:SendNotification",{text = "Du skal være i din lastbil for at starte ruten!",type = "error",timeout = (5000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		DrawMarker(27, 1157.236, -3272.024, 6.000 -1, 0, 0, 0, 0, 0, 0, 3.0001, 3.0001, 1.5001, 255, 165, 0,165, 0, 0, 0,0) --- The GoPostal depot location
		if GetDistanceBetweenCoords(1157.236, -3272.024, 5.900, GetEntityCoords(LocalPed())) < 2.0 then
			basiccheck()
		end
		if onjob == true then
			if GetDistanceBetweenCoords(fueldestinations[l].x,fueldestinations[l].y,fueldestinations[l].z - 1, GetEntityCoords(GetPlayerPed(-1))) < 3.0 then
				if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("packer")) or IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("phantom")) or IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("phantom3")) then
					drawTxt('[~g~E~s~] for at levere ~b~brændstof', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
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
		if GetDistanceBetweenCoords(1157.236, -3272.024, 5.900, GetEntityCoords(LocalPed())) < 2.0 then
			canceljob()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
	if onjob == true then
	DrawMarker(27,fueldestinations[l].x,fueldestinations[l].y,fueldestinations[l].z -0.8, 0, 0, 0, 0, 0, 0, 3.0001, 3.0001, 1.5001, 255, 165, 0,165, 0, 0, 0,0)
	end
end
end)

function canceljob()
	if onjob == true then
		if (IsInVehicle()) then
			if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("packer")) or IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("phantom")) or IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("phantom3")) then
				drawTxt('[~g~H}~s~] for at afslutte din ~b~rute', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
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
					TriggerServerEvent('truckerfuel:checkjob')
				end
			else
				drawTxt('[~g~E~s~] for at starte din ~b~rute', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
				if (IsControlJustReleased(1, 38)) then
				TriggerEvent('notruckfuel')
				end
			end	
		else
			drawTxt('[~g~E~s~] for at starte din ~b~rute', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
			if (IsControlJustReleased(1, 38)) then
				TriggerEvent('notruckfuel')
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
	local vehicle = GetHashKey('tanker')

	RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end
	
    local y = -3282.4243164063+math.random()*15.5*2 

	local plate = math.random(100, 900)
	local spawned_car = CreateVehicle(vehicle, 1135.4125976563,y,5.9004874954224,270.42289733887, true, false)
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
	
area = math.random(1,3)
	if area == 1 then 
		l = math.random(1,28)
	end
	if area == 2 then 
		l = math.random(29,41)
	end
	if area == 3 then 
		l = math.random(42,50)
	end

	deliveryblip = (AddBlipForCoord(fueldestinations[l].x,fueldestinations[l].y,fueldestinations[l].z))
	SetBlipSprite(deliveryblip, 280)
	SetBlipRoute(deliveryblip,  true)
end

function truckersucces()
TriggerServerEvent('truckerfuel:success',fueldestinations[l].money)
	if visits == 5 then --change 5 to however many runs you want a person to be able to make before having to return to the depot
		RemoveBlip(deliveryblip)
		onjob = false
		visits = 1
		area = 0
		TriggerEvent("pNotify:SendNotification",{text = "Vend tilbage til en lastbilcentral for at hente en ny trailer!",type = "success",timeout = (5000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		-- SetNewWaypoint(522.156, -2128.895)
	else
		RemoveBlip(deliveryblip)
		startjob()
		visits = visits + 1
	end
end

-- not very clean but i took it from my blip script in wich there are more
--Did not test this part in this script, so if it somehow does not work delete the part below and make your own blip :)
local blips = {
	{title="Lastbil tankvogne", colour=18, id=436, x=1157.236, y=-3272.024, z=5.900},
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