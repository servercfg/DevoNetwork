local using = false
local lastPos = nil
local anim = "ryg"
local animscroll = 0
local object = nil
local ObjectVert = nil
local ObjectVertY = nil
local OjbectDir = nil
local isBed = nil

--/// HEALING CONFIG
--/// IF PLAYER LAYS IN A BED, THEN HE WILL BE HEALED
local oHealing = true --// True = Enabled / False = Disabled
local oHealingMS = 4500  --// You health 1 health every 4.5 second
local oHealingVariable = false --// DO NOT CHANGE
--///

local chairs = {
	locations = {
		[1] = {object="v_med_bed1", verticalOffset=-0.0, verticalOffset=0.0, direction=0.0, bed=true},
		[2] = {object="v_med_bed2", verticalOffset=-0.0, verticalOffset=0.0, direction=0.0, bed=true},
		[3] = {object="v_serv_ct_chair02", verticalOffset=-0.0, verticalOffsetY=0.0, direction=168.0, bed=false},
		[4] = {object="prop_off_chair_04", verticalOffset=-0.4, verticalOffsetY=0.0, direction=168.0, bed=false},
		[5] = {object="prop_off_chair_03", verticalOffset=-0.4, verticalOffsetY=0.0, direction=168.0, bed=false},
		[6] = {object="prop_off_chair_05", verticalOffset=-0.4, verticalOffsetY=0.0, direction=168.0, bed=false},
		[7] = {object="v_club_officechair", verticalOffset=-0.4, verticalOffsetY=0.0, direction=168.0, bed=false},
		[8] = {object="v_ilev_leath_chr", verticalOffset=-0.4, verticalOffsetY=0.0, direction=168.0, bed=false},
		[9] = {object="v_corp_offchair", verticalOffset=-0.4, verticalOffsetY=0.0, direction=168.0, bed=false},
		[10] = {object="v_med_emptybed", verticalOffset=-0.2, verticalOffsetY=0.13, direction=90.0, bed=false},
		[11] = {object="Prop_Off_Chair_01", verticalOffset=-0.5, verticalOffsetY=-0.1, direction=180.0, bed=false}
	}
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for _, item in pairs(chairs.locations) do
			local pedPos = GetEntityCoords(PlayerPedId(), false)
			local objectC = GetClosestObjectOfType(pedPos.x, pedPos.y, pedPos.z, 0.8, GetHashKey(item.object), 0, 0, 0)
			if objectC ~= 0 then
				object = objectC
				ObjectVert = item.verticalOffset
				ObjectVertY = item.verticalOffsetY
				OjbectDir = item.direction
				isBed = item.bed
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local player = PlayerPedId()
		local getPlayerCoords = GetEntityCoords(player)
		local objectcoords = GetEntityCoords(object)
		if GetDistanceBetweenCoords(objectcoords.x, objectcoords.y, objectcoords.z,getPlayerCoords) < 1.5 and not using and DoesEntityExist(object) then
			if isBed == true then
				DrawText3Ds(objectcoords.x, objectcoords.y, objectcoords.z+0.30, "[~g~E~w~] for at ligge dig på "..anim)
				DrawText3Ds(objectcoords.x, objectcoords.y, objectcoords.z+0.20, "~w~ Skift mellem maven, ryggen og sidde med ~g~pile tasterne")
				if IsControlJustPressed(0, 175) then -- right
					animscroll = animscroll+1
					if animscroll == 0 then
						anim = "ryg"
					elseif animscroll == 1 then
						anim = "mave"
					elseif animscroll == 2 then
						animscroll = 1
					end
				end

				if IsControlJustPressed(0, 174) then -- left
					animscroll = animscroll-1
					if animscroll == -1 then
						animscroll = 0
					elseif animscroll == 0 then
						anim = "ryg"
					elseif animscroll == 1 then
						anim = "mave"
					elseif animscroll == 2 then
						animscroll = 0
						anim = "ryg"
					end
				end
				if IsControlJustPressed(0, 38) then
					if oHealing == true then
						oHealingVariable = math.abs(GetEntityHealth(PlayerPedId()) - 200)
					end
					Execute(object, false, false, false, isBed, player, objectcoords)
				end
			else
				DrawText3Ds(objectcoords.x, objectcoords.y, objectcoords.z+0.30, " [~g~E~w~] for at sidde")
				if IsControlJustPressed(0, 38) then
					Execute(object,ObjectVert,ObjectVertY,OjbectDir, isBed, player, objectcoords)
				end
			end
		end
		if using == true then
			Draw2DText("~g~F~w~ for at rejse dig op!",0,1,0.5,0.92,0.6,255,255,255,255)

			DisableControlAction( 0, 56, true )
			DisableControlAction( 0, 244, true )
			DisableControlAction( 0, 301, true )

			if IsControlJustPressed(0, 23) or IsControlJustPressed(0, 48) or IsControlJustPressed(0, 20) then
				ClearPedTasks(player)
				using = false
				local x,y,z = table.unpack(lastPos)
				if GetDistanceBetweenCoords(x, y, z,getPlayerCoords) < 10 then
					SetEntityCoords(player, lastPos)
				end
				FreezeEntityPosition(player, false)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(oHealingMS)
		if oHealing == true then
			if using == true then
				if oHealingVariable > 0 then
					oHealingVariable = oHealingVariable-1
					health = GetEntityHealth(PlayerPedId())
					if health <= 199 then
						SetEntityHealth(PlayerPedId(),health+5)
					end
				end
			end
		end
	end
end)

function Execute(object,vert,verty,dir, isBed, ped, objectcoords)
	lastPos = GetEntityCoords(ped)
	FreezeEntityPosition(object, true)
	SetEntityCoords(ped, objectcoords.x, objectcoords.y, objectcoords.z+-1.4)
	FreezeEntityPosition(ped, true)
	using = true
	if isBed == false then
		verticalOffset = vert
		direction = dir
		TaskStartScenarioAtPosition(ped, 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER', objectcoords.x, objectcoords.y-verty, objectcoords.z-verticalOffset, GetEntityHeading(object)+direction, 0, true, true)
	else
		verticalOffset = -1.4
		direction = 0.0
		if anim == "ryg" then
			TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE_BACK', objectcoords.x, objectcoords.y, objectcoords.z-verticalOffset, GetEntityHeading(object)+direction, 0, true, true)
		elseif anim == "mave" then
			TaskStartScenarioAtPosition(ped, 'WORLD_HUMAN_SUNBATHE', objectcoords.x, objectcoords.y, objectcoords.z-verticalOffset, GetEntityHeading(object)+direction, 0, true, true)
		end
	end
end




function DrawText3Ds(x,y,z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)

	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
		local factor = (string.len(text)) / 350
		DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 100)
	end
end

function Draw2DText(text,font,centre,x,y,scale,r,g,b,a)
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
	DrawText(x,y)
end
