-- Made by the legend, the myth... Jeff Motherfucking Jefferson. Daybourne og SocialRP stay the fuck away
-- Jeff er bedre kendt som Tanzcer, the legendary Minecraft YouTuber og Twitcher. Ikke kom her og tro du er noget.

vRPdv = {}
Tunnel.bindInterface("vrp_scrapyard",vRPdv)
Proxy.addInterface("vrp_scrapyard",vRPdv)
PMserver = Tunnel.getInterface("vrp_scrapyard","vrp_scrapyard")
vRPserver = Tunnel.getInterface("vRP","vrp_scrapyard")
vRP = Proxy.getInterface("vRP")

function LocalPed()
	return GetPlayerPed(-1)
end

function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
  SetTextFont(6)
  SetTextProportional(6)
  SetTextScale(scale/1.0, scale/1.0)
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

RegisterNetEvent("notMech")
AddEventHandler("notMech", function()
	TriggerEvent("pNotify:SendNotification",{text = "Du er ikke mekaniker.",type = "error",timeout = (5000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end)

RegisterNetEvent("scrapTheCar")
AddEventHandler("scrapTheCar", function()
    scrapThisCarNow()
end)

local scrapyards = {
	{title="Skrotplads", colour=15, id=380, x=-524.476, y=-1721.890, z=19.153},
	{title="Skrotplads", colour=15, id=380, x=176.278, y=2756.939, z=43.426},
	{title="Skrotplads", colour=15, id=380, x=-200.962, y=6268.174, z=31.489},
}

Citizen.CreateThread(function()
	while true do
		for _, yard in pairs(scrapyards) do
			DrawMarker(27, yard.x, yard.y, yard.z - 0.9, 0, 0, 0, 0, 0, 0, 5.0001, 5.0001, 1.5001, 0, 255, 255,165, 0, 0, 0,0)
            if GetDistanceBetweenCoords(yard.x, yard.y, yard.z, GetEntityCoords(LocalPed())) < 2.5 and DelayOnThis then 
                        DelayTrue()
                elseif GetDistanceBetweenCoords(yard.x, yard.y, yard.z, GetEntityCoords(LocalPed())) < 2.5 then
				whatsMyJob()
			end
		end
		Citizen.Wait(0)
	end
end)



Citizen.CreateThread(function()
    for _, yard in pairs(scrapyards) do
		yard.blip = AddBlipForCoord(yard.x, yard.y, yard.z)
		SetBlipSprite(yard.blip, yard.id)
		SetBlipDisplay(yard.blip, 4)
		SetBlipScale(yard.blip, 0.6)
		SetBlipColour(yard.blip, yard.colour)
		SetBlipAsShortRange(yard.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(yard.title)
		EndTextCommandSetBlipName(yard.blip)
	end
end)

function whatsMyJob()
	drawTxt('[~g~E~s~] for at skrotte køretøjet', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
	if (IsControlJustReleased(1, 38)) then
		TriggerServerEvent('scrapyard:checkjob')
            
            
	end
end

function DelayTrue()
	drawTxt('~r~Skrothandleren har ikke tid lige nu - kom igen om~b~ '..DelayTime..' ~r~sekunder.', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
    
end

function StartDelay()
	DelayTime = DelayTime - 1
        if DelayTime == 0 then
            DelayOnThis = false
        else
            Wait(1000)
            StartDelay()
        end
end

function scrapThisCarNow()
	local ped = GetPlayerPed(-1)
	local vehicle = getNearestVehicle(4)
	local payment = 1500 + math.random(0,1000)
	if vehicle ~= nil then
		if DoesEntityExist(vehicle) then
			if IsVehicleModel(vehicle, GetHashKey("flatbed")) or IsVehicleModel(vehicle, GetHashKey("rumpo3")) then
				TriggerEvent("pNotify:SendNotification",{text = "Du kan ikke skrotte dine arbejdskøretøjer.",type = "error",timeout = (2500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                end
                 if not DelayOnThis then
                    TriggerEvent("pNotify:SendNotification",{text = "Køretøjet blev skrottet.",type = "success",timeout = (2500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				    TriggerServerEvent('scrapyard:payMeNow',payment)
				    DeleteEntity(vehicle)
                    DelayOnThis = true
                    DelayTime = 150 + math.random(0,150)
                    StartDelay()
                else
				    TriggerEvent("pNotify:SendNotification",{text = "Der er nedkøling på skrotteren.",type = "error",timeout = (2500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close =  "gta_effects_fade_out"}})
			end
		else
			TriggerEvent("pNotify:SendNotification",{text = "Der blev ikke fundet et køretøj.",type = "error",timeout = (2500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end
	else
		TriggerEvent("pNotify:SendNotification",{text = "Der blev ikke fundet et køretøj.",type = "error",timeout = (2500),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end
end

function getNearestVehicle(radius)
	local x,y,z = vRP.getPosition()
	local ped = GetPlayerPed(-1)
	if IsPedSittingInAnyVehicle(ped) then
		return GetVehiclePedIsIn(ped, true)
	else
		local veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001, radius+0.0001, 0, 8192+4096+4+2+1)
		if not IsEntityAVehicle(veh) then veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001, radius+0.0001, 0, 4+2+1) end
		return veh
	end
end

function GetVehicleInDirection(coordFrom,coordTo)
    local rayHandle = CastRayPointToPoint(coordFrom.x,coordFrom.y,coordFrom.z,coordTo.x,coordTo.y,coordTo.z,10,GetPlayerPed(-1),0)
    local _,_,_,_,vehicle = GetRaycastResult(rayHandle)
    return vehicle
end
 
