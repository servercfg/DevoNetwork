local Weapons = {}
-----------------------------------------------------------
-----------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local playerPed = GetPlayerPed(-1)
		
		for i=1, #Config.RealWeapons, 1 do
			
    		local weaponHash = GetHashKey(Config.RealWeapons[i].name)
			
    		if HasPedGotWeapon(playerPed, weaponHash, false) then
    			local onPlayer = false
				
                GiveWeaponComponentToPed(playerPed, GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_02"))
                GiveWeaponComponentToPed(playerPed, GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
                GiveWeaponComponentToPed(playerPed, GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
                GiveWeaponComponentToPed(playerPed, GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
                GiveWeaponComponentToPed(playerPed, GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
                --M4
                GiveWeaponComponentToPed(playerPed, GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
                GiveWeaponComponentToPed(playerPed, GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
                GiveWeaponComponentToPed(playerPed, GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
                -- SMG magasin, lys samt camo.
                GiveWeaponComponentToPed(playerPed, GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_02"))
                GiveWeaponComponentToPed(playerPed, GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))
                -- Finskytte sigte
                GiveWeaponComponentToPed(playerPed, GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MAX"))
                --Combatpistol lys
                GiveWeaponComponentToPed(playerPed, GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))

				for k, entity in pairs(Weapons) do
					if entity then
						if entity.weapon == Config.RealWeapons[i].name then
							onPlayer = true
							break
						end
					end
				end
	      		
      			--[[if not onPlayer and weaponHash ~= GetSelectedPedWeapon(playerPed) then
	      			SetGear(Config.RealWeapons[i].name)
					elseif onPlayer and weaponHash == GetSelectedPedWeapon(playerPed) then
	      			RemoveGear(Config.RealWeapons[i].name)
				end
				else
				RemoveGear(Config.RealWeapons[i].name)]]
			end
		end
		Wait(400)
	end
end)
-----------------------------------------------------------
-----------------------------------------------------------
RegisterNetEvent('removeWeapon')
AddEventHandler('removeWeapon', function(weaponName)
	RemoveGear(weaponName)
end)
RegisterNetEvent('removeWeapons')
AddEventHandler('removeWeapons', function()
	RemoveGears()
end)
-----------------------------------------------------------
-----------------------------------------------------------
-- Remove only one weapon that's on the ped
function RemoveGear(weapon)
	local _Weapons = {}
	
	for i, entity in pairs(Weapons) do
		if entity.weapon ~= weapon then
			_Weapons[i] = entity
			else
			DeleteWeapon(entity.obj)
		end
	end
	
	Weapons = _Weapons
end
-----------------------------------------------------------
-----------------------------------------------------------
-- Remove all weapons that are on the ped
function RemoveGears()
	for i, entity in pairs(Weapons) do
		DeleteWeapon(entity.obj)
	end
	Weapons = {}
end
-----------------------------------------------------------
-----------------------------------------------------------
function SpawnObject(model, coords, cb)
	
	local model = (type(model) == 'number' and model or GetHashKey(model))
	
	Citizen.CreateThread(function()
		
		RequestModel(model)
		
		while not HasModelLoaded(model) do
			Citizen.Wait(200)
		end
		
		local obj = CreateObject(model, coords.x, coords.y, coords.z, true, true, true)
		SetEntityAsNoLongerNeeded(obj)
		
		if cb ~= nil then
			cb(obj)
		end
		
	end)
	
end

function DeleteWeapon(object)
	SetEntityAsMissionEntity(object,  false,  true)
	DeleteObject(object)
end
-- Add one weapon on the ped
--[[function SetGear(weapon)
	local bone       = nil
	local boneX      = 0.0
	local boneY      = 0.0
	local boneZ      = 0.0
	local boneXRot   = 0.0
	local boneYRot   = 0.0
	local boneZRot   = 0.0
	local playerPed  = GetPlayerPed(-1)
	local model      = nil
	local playerWeapons = getWeapons()
	
	for i=1, #Config.RealWeapons, 1 do
		if Config.RealWeapons[i].name == weapon then
			bone     = Config.RealWeapons[i].bone
			boneX    = Config.RealWeapons[i].x
			boneY    = Config.RealWeapons[i].y
			boneZ    = Config.RealWeapons[i].z
			boneXRot = Config.RealWeapons[i].xRot
			boneYRot = Config.RealWeapons[i].yRot
			boneZRot = Config.RealWeapons[i].zRot
			model    = Config.RealWeapons[i].model
			break
		end
	end
	
	SpawnObject(model, {
		x = x,
		y = y,
		z = z
		}, function(obj)
		local playerPed = GetPlayerPed(-1)
		local boneIndex = GetPedBoneIndex(playerPed, bone)
		local bonePos 	= GetWorldPositionOfEntityBone(playerPed, boneIndex)
		AttachEntityToEntity(obj, playerPed, boneIndex, boneX, boneY, boneZ, boneXRot, boneYRot, boneZRot, false, false, false, false, 2, true)
		table.insert(Weapons,{weapon = weapon, obj = obj})
	end)
end]]

local weapon_types = {
	"WEAPON_KNIFE",
	"WEAPON_STUNGUN",
	"WEAPON_FLASHLIGHT",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BAT",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_PISTOL",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_MICROSMG",
	"WEAPON_SMG",
	"WEAPON_ASSAULTSMG",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_CARBINERIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_STUNGUN",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_REMOTESNIPER",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RPG",
	"WEAPON_PASSENGER_ROCKET",
	"WEAPON_AIRSTRIKE_ROCKET",
	"WEAPON_STINGER",
	"WEAPON_MINIGUN",
	"WEAPON_GRENADE",
	"WEAPON_STICKYBOMB",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_BZGAS",
	"WEAPON_MOLOTOV",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_PETROLCAN",
	"WEAPON_DIGISCANNER",
	"WEAPON_BRIEFCASE",
	"WEAPON_BRIEFCASE_02",
	"WEAPON_BALL",
	"WEAPON_FLARE",
	--"WEAPON_UNARMED",
	"WEAPON_BOTTLE",
	"WEAPON_ANIMAL",
	"WEAPON_KNUCKLE",
	"WEAPON_SNSPISTOL",
	"WEAPON_COUGAR",
	"WEAPON_KNIFE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BAT",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_PISTOL",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_MICROSMG",
	"WEAPON_SMG",
	"WEAPON_ASSAULTSMG",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_CARBINERIFLE",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_STUNGUN",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_REMOTESNIPER",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RPG",
	"WEAPON_PASSENGER_ROCKET",
	"WEAPON_AIRSTRIKE_ROCKET",
	"WEAPON_STINGER",
	"WEAPON_MINIGUN",
	"WEAPON_GRENADE",
	"WEAPON_STICKYBOMB",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_BZGAS",
	"WEAPON_MOLOTOV",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_PETROLCAN",
	"WEAPON_DIGISCANNER",
	"WEAPON_BRIEFCASE",
	"WEAPON_BRIEFCASE_02",
	"WEAPON_BALL",
	"WEAPON_FLARE",
	"WEAPON_VEHICLE_ROCKET",
	"WEAPON_BARBED_WIRE",
	"WEAPON_DROWNING",
	"WEAPON_DROWNING_IN_VEHICLE",
	"WEAPON_BLEEDING",
	"WEAPON_ELECTRIC_FENCE",
	"WEAPON_EXPLOSION",
	"WEAPON_FALL",
	"WEAPON_HIT_BY_WATER_CANNON",
	"WEAPON_RAMMED_BY_CAR",
	"WEAPON_RUN_OVER_BY_CAR",
	"WEAPON_HELI_CRASH",
	"WEAPON_FIRE",
	"GADGET_NIGHTVISION",
	"GADGET_PARACHUTE",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_PROXMINE",
	"WEAPON_SNOWBALL",
	"WEAPON_FLAREGUN",
	"WEAPON_GARBAGEBAG",
	"WEAPON_HANDCUFFS",
	"WEAPON_COMBATPDW",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_HATCHET",
	"WEAPON_RAILGUN",
	"WEAPON_MACHETE",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_AIR_DEFENCE_GUN",
	"WEAPON_SWITCHBLADE",
	"WEAPON_REVOLVER"
}

function getWeapons()
	local player = GetPlayerPed(-1)
	
	local ammo_types = {} -- remember ammo type to not duplicate ammo amount
	
	local weapons = {}
	for k,v in pairs(weapon_types) do
		local hash = GetHashKey(v)
		if HasPedGotWeapon(player,hash) then
			local weapon = {}
			weapons[v] = weapon
			
			local atype = Citizen.InvokeNative(0x7FEAD38B326B9F74, player, hash)
			if ammo_types[atype] == nil then
				ammo_types[atype] = true
				weapon.ammo = GetAmmoInPedWeapon(player,hash)
				else
				weapon.ammo = 0
			end
		end
	end
	
	return weapons
end

-----------------------------------------------------------
-----------------------------------------------------------
-- Add all the weapons in the xPlayer's loadout
-- on the ped
function SetGears()
	local bone       = nil
	local boneX      = 0.0
	local boneY      = 0.0
	local boneZ      = 0.0
	local boneXRot   = 0.0
	local boneYRot   = 0.0
	local boneZRot   = 0.0
	local playerPed  = GetPlayerPed(-1)
	local model      = nil
	local playerWeapons = getWeapons()
	local weapon 	 = nil
	
	for k,v in pairs(playerWeapons) do
		
		for j=1, #Config.RealWeapons, 1 do
			if Config.RealWeapons[j].name == k then
				
				bone     = Config.RealWeapons[j].bone
				boneX    = Config.RealWeapons[j].x
				boneY    = Config.RealWeapons[j].y
				boneZ    = Config.RealWeapons[j].z
				boneXRot = Config.RealWeapons[j].xRot
				boneYRot = Config.RealWeapons[j].yRot
				boneZRot = Config.RealWeapons[j].zRot
				model    = Config.RealWeapons[j].model
				weapon   = Config.RealWeapons[j].name 
				
				break
				
			end
		end
		
		local _wait = true
		
		SpawnObject(model, {
			x = x,
			y = y,
			z = z
			}, function(obj)
			
			local playerPed = GetPlayerPed(-1)
			local boneIndex = GetPedBoneIndex(playerPed, bone)
			local bonePos 	= GetWorldPositionOfEntityBone(playerPed, boneIndex)
			
			AttachEntityToEntity(obj, playerPed, boneIndex, boneX, boneY, boneZ, boneXRot, boneYRot, boneZRot, false, false, false, false, 2, true)						
			
			table.insert(Weapons,{weapon = weapon, obj = obj})
			
			_wait = false
			
		end)
		
		while _wait do
			Wait(200)
		end
	end
	
end

Citizen.CreateThread(function() while true do Citizen.Wait(30000) collectgarbage() end end) -- Fix RAM leaks by collecting garbage
