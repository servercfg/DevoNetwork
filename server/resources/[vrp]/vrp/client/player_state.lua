
-- periodic player state update

local state_ready = false

AddEventHandler("playerSpawned",function() -- delay state recording
  state_ready = false
  
  Citizen.CreateThread(function()
    Citizen.Wait(30000)
    state_ready = true
  end)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(30000)

    if IsPlayerPlaying(PlayerId()) and state_ready then
      local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
      vRPserver.ping({})
      vRPserver.updatePos({x,y,z})
      vRPserver.updateHealth({tvRP.getHealth()})
      vRPserver.updateWeapons({tvRP.getWeapons()})
      vRPserver.updateCustomization({tvRP.getCustomization()})
    end
  end
end)

-- WEAPONS

-- def
local weapon_types = {
  "GADGET_PARACHUTE",
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
  "WEAPON_HEAVYSNIPER_MK2",
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

function tvRP.getWeaponTypes()
  return weapon_types
end

function tvRP.getWeapons()
  local player = GetPlayerPed(-1)

  local ammo_types = {} -- remember ammo type to not duplicate ammo amount

  local weapons = {}
  for k,v in pairs(weapon_types) do
    local model = string.upper(v)
    local hash = GetHashKey(model)
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
    
    weapons[model] = weapon
    end
  end

  return weapons
end

-- replace weapons (combination of getWeapons and giveWeapons)
-- return previous weapons
function tvRP.replaceWeapons(weapons)
  local old_weapons = tvRP.getWeapons()
  tvRP.giveWeapons({weapons}, true)
  return old_weapons
end

function tvRP.giveWeapons(weapons,clear_before)
  local player = GetPlayerPed(-1)

  -- give weapons to player

  if clear_before then
    RemoveAllPedWeapons(player,true)
  end

  for k,weapon in pairs(weapons) do
    local hash = GetHashKey(k)
    local ammo = weapon.ammo or 0

    GiveWeaponToPed(player, hash, ammo, false)
  end
end

function tvRP.removeWeapons(weapons)
  local player = GetPlayerPed(-1)

  -- remove weapons from player

  for k,weapon in pairs(weapons) do
    local hash = GetHashKey(k)

    RemoveWeaponFromPed(player, hash)
  end
end

--[[
function tvRP.dropWeapon()
  SetPedDropsWeapon(GetPlayerPed(-1))
end
--]]

-- PLAYER CUSTOMIZATION

-- parse part key (a ped part or a prop part)
-- return is_proppart, index
local function parse_part(key)
  if type(key) == "string" and string.sub(key,1,1) == "p" then
    return true,tonumber(string.sub(key,2))
  else
    return false,tonumber(key)
  end
end

function tvRP.getDrawables(part)
  local isprop, index = parse_part(part)
  if isprop then
    return GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1),index)
  else
    return GetNumberOfPedDrawableVariations(GetPlayerPed(-1),index)
  end
end

function tvRP.getDrawableTextures(part,drawable)
  local isprop, index = parse_part(part)
  if isprop then
    return GetNumberOfPedPropTextureVariations(GetPlayerPed(-1),index,drawable)
  else
    return GetNumberOfPedTextureVariations(GetPlayerPed(-1),index,drawable)
  end
end

function tvRP.getCustomization()
  local ped = GetPlayerPed(-1)

  local custom = {}

  custom.modelhash = GetEntityModel(ped)

  -- ped parts
  for i=0,20 do -- index limit to 20
    custom[i] = {GetPedDrawableVariation(ped,i), GetPedTextureVariation(ped,i), GetPedPaletteVariation(ped,i)}
  end

  -- props
  for i=0,10 do -- index limit to 10
    custom["p"..i] = {GetPedPropIndex(ped,i), math.max(GetPedPropTextureIndex(ped,i),0)}
  end

  return custom
end

-- partial customization (only what is set is changed)
function tvRP.setCustomization(custom) -- indexed [drawable,texture,palette] components or props (p0...) plus .modelhash or .model
  local exit = TUNNEL_DELAYED() -- delay the return values

  Citizen.CreateThread(function() -- new thread
    if custom then
      local ped = GetPlayerPed(-1)
      local mhash = nil

      -- model
      if custom.modelhash ~= nil then
        mhash = custom.modelhash
      elseif custom.model ~= nil then
        mhash = GetHashKey(custom.model)
      end

      if mhash ~= nil then
        local i = 0
        while not HasModelLoaded(mhash) and i < 10000 do
          RequestModel(mhash)
          Citizen.Wait(10)
        end

        if HasModelLoaded(mhash) then
          -- changing player model remove weapons, so save it
          local weapons = tvRP.getWeapons()
          SetPlayerModel(PlayerId(), mhash)
          tvRP.giveWeapons(weapons,true)
          SetModelAsNoLongerNeeded(mhash)
        end
      end

      ped = GetPlayerPed(-1)

      -- parts
      for k,v in pairs(custom) do
        if k ~= "model" and k ~= "modelhash" then
          local isprop, index = parse_part(k)
          if isprop then
            if v[1] < 0 then
              ClearPedProp(ped,index)
            else
              SetPedPropIndex(ped,index,v[1],v[2],v[3] or 2)
            end
          else
            SetPedComponentVariation(ped,index,v[1],v[2],v[3] or 2)
          end
        end
      end
    end

    exit({})
  end)
end
