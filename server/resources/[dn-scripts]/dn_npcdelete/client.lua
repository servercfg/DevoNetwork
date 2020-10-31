vRPnpcd = {}
Tunnel.bindInterface("hp_npcdelete",vRPnpcd)

weapon_types = {
  "WEAPON_ANIMAL",
  "WEAPON_UNARMED",
  "WEAPON_ADVANCEDRIFLE",
  "WEAPON_AIRSTRIKE_ROCKET",
  "WEAPON_APPISTOL",
  "WEAPON_ASSAULTRIFLE",
  "WEAPON_ASSAULTRIFLE_MK2",
  "WEAPON_ASSAULTSHOTGUN",
  "WEAPON_ASSAULTSMG",
  "WEAPON_AUTOSHOTGUN",
  "WEAPON_BALL",
  "WEAPON_BAT",
  "WEAPON_BATTLEAXE",
  "WEAPON_BOTTLE",
  "WEAPON_BRIEFCASE",
  "WEAPON_BRIEFCASE_02",
  "WEAPON_BULLPUPRIFLE",
  "WEAPON_BULLPUPSHOTGUN",
  "WEAPON_BZGAS",
  "WEAPON_CARBINERIFLE",
  "WEAPON_CARBINERIFLE_MK2",
  "WEAPON_COMBATMG",
  "WEAPON_COMBATMG_MK2",
  "WEAPON_COMBATPDW",
  "WEAPON_COMBATPISTOL",
  "WEAPON_COMPACTLAUNCHER",
  "WEAPON_COMPACTRIFLE",
  "WEAPON_CROWBAR",
  "WEAPON_DAGGER",
  "WEAPON_DBSHOTGUN",
  "WEAPON_DIGISCANNER",
  "WEAPON_FIREEXTINGUISHER",
  "WEAPON_FIREWORK",
  "WEAPON_FLARE",
  "WEAPON_FLAREGUN",
  "WEAPON_FLASHLIGHT",
  "WEAPON_GOLFCLUB",
  "WEAPON_GRENADE",
  "WEAPON_GRENADELAUNCHER",
  "WEAPON_GRENADELAUNCHER_SMOKE",
  "WEAPON_GUSENBERG",
  "WEAPON_HAMMER",
  "WEAPON_HATCHET",
  "WEAPON_HEAVYPISTOL",
  "WEAPON_HEAVYSHOTGUN",
  "WEAPON_HEAVYSNIPER",
  "WEAPON_HOMINGLAUNCHER",
  "WEAPON_KNIFE",
  "WEAPON_KNUCKLE",
  "WEAPON_MACHETE",
  "WEAPON_MACHINEPISTOL",
  "WEAPON_MARKSMANPISTOL",
  "WEAPON_MARKSMANRIFLE",
  "WEAPON_MG",
  "WEAPON_MICROSMG",
  "WEAPON_MINIGUN",
  "WEAPON_MINISMG",
  "WEAPON_MOLOTOV",
  "WEAPON_MUSKET",
  "WEAPON_NIGHTSTICK",
  "WEAPON_PASSENGER_ROCKET",
  "WEAPON_PETROLCAN",
  "WEAPON_PIPEBOMB",
  "WEAPON_PISTOL",
  "WEAPON_PISTOL_MK2",
  "WEAPON_PISTOL50",
  "WEAPON_POOLCUE",
  "WEAPON_PROXMINE",
  "WEAPON_PUMPSHOTGUN",
  "WEAPON_RAILGUN",
  "WEAPON_REMOTESNIPER",
  "WEAPON_REVOLVER",
  "WEAPON_RPG",
  "WEAPON_SAWNOFFSHOTGUN",
  "WEAPON_SMG",
  "WEAPON_SMG_MK2",
  "WEAPON_SMOKEGRENADE",
  "WEAPON_SNIPERRIFLE",
  "WEAPON_SNOWBALL",
  "WEAPON_SNSPISTOL",
  "WEAPON_SPECIALCARBINE",
  "WEAPON_STICKYBOMB",
  "WEAPON_STINGER",
  "WEAPON_STUNGUN",
  "WEAPON_SWITCHBLADE",
  "WEAPON_VINTAGEPISTOL",
  "WEAPON_WRENCH"
}

weapon_names = {}

for index, value in ipairs(weapon_types) do
  weapon_names[GetHashKey(value)] = value
end

relationshipgroups = {
  "AGGRESSIVE_INVESTIGATE",
  "AMBIENT_GANG_BALLAS",
  "AMBIENT_GANG_CULT",
  "AMBIENT_GANG_FAMILY",
  "AMBIENT_GANG_HILLBILLY",
  "AMBIENT_GANG_LOST",
  "AMBIENT_GANG_MARABUNTE",
  "AMBIENT_GANG_MEXICAN",
  "AMBIENT_GANG_SALVA",
  "AMBIENT_GANG_WEICHENG",
  "COP",
  "FIREMAN",
  "GANG_1",
  "GANG_10",
  "GANG_2",
  "GANG_9",
  "PRIVATE_SECURITY",
  "SECURITY_GUARD"
}

group_names = {}

for index, value in ipairs(relationshipgroups) do
  group_names[GetHashKey(value)] = value
end

police = true
ems = true

Citizen.CreateThread(function()
	Citizen.Wait(30000)
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end
end)

Citizen.CreateThread(function()
	local function should_delete(tab, val)
		for index, value in ipairs(tab) do
			if GetHashKey(value) == val then
				return true
			end
		end
		return false
	end
  
	while true do
		Citizen.Wait(1000)
		local handle, ped = FindFirstPed()
		local success
		repeat
			if (should_delete(relationshipgroups,GetPedRelationshipGroupHash(ped)) or GetBestPedWeapon(ped) ~= GetHashKey("WEAPON_UNARMED")) and IsPedHuman(ped) and not IsPedAPlayer(ped) and not IsEntityDead(ped) and GetDistanceBetweenCoords(GetEntityCoords(ped),3060.0478515625,-4715.671875,40.261618614197,false) > 800.0 then
        if weapon_names[GetBestPedWeapon(ped)] ~= nil then
          ped_weapon = weapon_names[GetBestPedWeapon(ped)]
        elseif GetBestPedWeapon(ped) ~= nil then
          ped_weapon = GetBestPedWeapon(ped)
        else
          ped_weapon = "Unknown"
        end
        if group_names[GetPedRelationshipGroupHash(ped)] ~= nil then
          ped_group = group_names[GetPedRelationshipGroupHash(ped)]
        elseif GetPedRelationshipGroupHash(ped) ~= nil then
          ped_group = GetPedRelationshipGroupHash(ped)
        else
          ped_group = "Unknown"
        end
				local vehicle = GetVehiclePedIsIn(ped,false)

        ped_model = GetEntityModel(ped)
				
        if vehicle ~= 0 then
          ped_vehicle = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
          SetEntityAsMissionEntity(vehicle, true, true)
          DeleteVehicle(vehicle)
          Citizen.Wait(100)
        else
          ped_vehicle = "None"          
				end
        
        ped_posx = 0
        ped_posy = 0
        ped_posz = 0
        ped_posx, ped_posy, ped_posz = table.unpack(GetEntityCoords(ped,false))
        
        if IsEntityVisible(ped) then
          SetPedDropsWeaponsWhenDead(ped,false)
          if not GetPedConfigFlag(ped,52,1) then SetPedConfigFlag(ped,52,true) end
          if not GetPedConfigFlag(ped,62,1) then SetPedConfigFlag(ped,62,true) end
          if not GetPedConfigFlag(ped,292,1) then SetPedConfigFlag(ped,292,true) end
          SetEntityAsNoLongerNeeded(ped)
          SetEntityInvincible(ped, true)
          SetEntityVisible(ped, false, false)
          -- print("NPCDelete - "..ped_weapon.." - "..ped_group.." - "..ped_vehicle.." - "..ped_model.." - "..ped_posx..","..ped_posy..","..ped_posz)
        end
        
        Citizen.Wait(100)
			end
			success, ped = FindNextPed(handle)
		until not success
		EndFindPed(handle)
		DisablePlayerVehicleRewards(PlayerId())
		if not police then
			RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"))  -- Nightstick
			RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"))  -- Combat Pistol (tjeneste pistol)
			RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"))  -- Carbine Rifle
			RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"))  -- Pump Shotgun
			RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"))  -- SMG
			RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"))  -- Sniper Rifle
			RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"))  -- SPECIALCARBINE
		end
		if not police or not ems then
			RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"))  -- Stungun
		end
		if police or ems or not police or not ems then 
			RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_RPG"))  -- RPG
			RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MINIGUN"))  -- Minigun
		end
	end
end)

RegisterNetEvent("hp:npcdelete")
AddEventHandler("hp:npcdelete", function(isPolice)
	police = isPolice
end)