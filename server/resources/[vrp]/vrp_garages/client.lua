--[[
FiveM Scripts
Copyright C 2018  Sighmir

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
at your option any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

--[[Proxy/Tunnel]]--

vRPgt = {}
Tunnel.bindInterface("vRP_garages",vRPgt)
Proxy.addInterface("vRP_garages",vRPgt)
vRP = Proxy.getInterface("vRP")

--[[Local/Global]]--
--127.1639175415,6611.7529296875,31.848024368286

GVEHICLES = {}
local inrangeofgarage = false
local currentlocation = nil

local garages = {
  {name="Garage", colour=3, id=357, x=1703.01, y=3597.39, z=34.488, h=0.0},
  {name="Garage", colour=3, id=357, x=-334.685, y=289.773, z=84.890, h=0.0},
  {name="Garage", colour=3, id=357, x=-55.272, y=-1838.71, z=25.600, h=0.0},
  {name="Garage", colour=3, id=357, x=126.434, y=6610.04, z=30.890, h=0.0},
  {name="Garage", colour=3, id=357, x=215.489, y=-789.807, z=29.9, h=0.0}, 
  {name="Garage", colour=3, id=357, x=2667.08, y=1671.27, z=24.549, h=0.0}, 
  {name="Garage", colour=3, id=357, x=36.003, y=-875.029, z=29.4, h=0.0},
  {name="Garage", colour=3, id=357, x=291.122, y=-338.088, z=43.96, h=0.0},
  {name="Garage", colour=3, id=357, x=1222.464, y=2709.40, z=37.02, h=0.0},
  {name="Garage", colour=3, id=357, x=2486.689, y=4118.995, z=37.10, h=0.0},
  {name="Garage", colour=3, id=357, x=-3248.768, y=991.168, z=11.50, h=0.0},
  {name="Garage", colour=3, id=357, x=-3047.700, y=600.959, z=6.40, h=0.0},
  {name="Garage", colour=3, id=357, x=-2032.561, y=-473.449, z=10.50, h=0.0},
  {name="Garage", colour=3, id=357, x=-1582.649, y=-1014.555, z=12.11, h=0.0},
  {name="Garage", colour=3, id=357, x=-796.162, y=-1284.970, z=4.10, h=0.0},
  {name="Garage", colour=3, id=357, x=2569.764, y=320.533, z=107.55, h=0.0},
  {name="Garage", colour=3, id=357, x=3573.258, y=3778.912, z=29.00, h=0.0},
  {name="Garage", colour=3, id=357, x=1695.880, y=4939.893, z=41.23, h=0.0},
  {name="Garage", colour=3, id=357, x=223.625, y=1223.685, z=224.56, h=0.0},
  {name="Garage", colour=3, id=357, x=-1913.113, y=2035.893, z=139.80, h=0.0},
  {name="Garage", colour=3, id=357, x=-1820.702, y=809.011, z=137.88, h=0.0},
  {name="Garage", colour=3, id=357, x=-755.846, y=5540.000, z=32.50, h=0.0},
  {name="Garage", x=1129.82, y=-793.82, z=56.620, h=0.0},
  {name="Garage", x=1406.855, y=1118.308, z=113.837, h=0.0},
  {name="Garage", x=-1530.9027099609, y=84.272033691406, z=55.808927154541, h=0.0},
  {name="Garage", x=87.898658752441, y=-1969.3287353516, z=19.747470855713, h=0.0},
  {name="Garage", x=14.54638004303, y=547.85467529297, z=176.14010620117, h=0.0}, -- Members Only
  {name="Garage", x=-825.48760986328, y=180.03248596191, z=70.577432250977, h=0.0}, -- Mafia
  {name="Garage", x=950.11114501953, y=-122.76261138916, z=74.353134155273, h=0.0}, -- HA
  {name="Garage", x=-552.84252929688, y=302.16781616211, z=82.283700561523, h=0.0}, -- Lost
  {name="Garage", x=-15.169131278992, y=-1085.6313476563, z=25.672069549561, h=0.0}, -- Bilforhandler
  {name="Garage", x=329.26654052734, y=-2035.6627197266, z=20.955013275146, h=0.0}, -- Carola
  {name="Garage", x=1862.2467041016, y=2632.7834472656, z=45.672058105469, h=0.0}, -- Fængselt
  {name="Garage", x=986.02728271484, y=-1819.8468017578, z=30.151231765747, h=0.0}, -- Auto Genbrug
  {name="Garage", x=143.76870727539, y=-1331.1066894531, z=29.202289581299, h=0.0}, -- Stripklub
  {name="Garage", x=-976.17486572266, y=-1472.8972167969, z=4.0202493667603, h=0.0}, -- Yakuza
}

vehicles = {}
garageSelected = { {x=nil, y=nil, z=nil, h=nil}, }
selectedPage = 0

lang_string = {
  menu1 = "Opbevar køretøj",
  menu2 = "Hent køretøj",
  menu3 = "Luk",
  menu4 = "KØretØjer",
  menu5 = "Options",
  menu6 = "Hent",
  menu7 = "Tilbage",
  menu8 = "Tryk ~g~E~s~ for at åbne garagen",
  menu9 = "Sælg",
  menu10 = "~g~E~s~ to sell the vehicle at 50% of the purchase price",
  menu11 = "Opdater",
  menu12 = "Næste",
  state1 = "Ud",
  state2 = "Ind",
  text1 = "The area is crowded",
  text2 = "Dette køretøj er ikke i garagen ",
  text3 = "Vehicle out",
  text4 = "Det er ikke dit køretøj!",
  text5 = "Køretøjet er gemt G",
  text6 = "No vehicles present",
  text7 = "Vehicle sold",
  text8 = "Nyd din nye bil!",
  text9 = "Ikke nok penge.",
  text10 = "Vehicle updated"
}
--[[Functions]]--

function vRPgt.spawnGarageVehicle(vtype, name, vehicle_plate, vehicle_colorprimary, vehicle_colorsecondary, vehicle_pearlescentcolor, vehicle_wheelcolor, vehicle_plateindex, vehicle_neoncolor1, vehicle_neoncolor2, vehicle_neoncolor3, vehicle_windowtint, vehicle_wheeltype, vehicle_mods0, vehicle_mods1, vehicle_mods2, vehicle_mods3, vehicle_mods4, vehicle_mods5, vehicle_mods6, vehicle_mods7, vehicle_mods8, vehicle_mods9, vehicle_mods10, vehicle_mods11, vehicle_mods12, vehicle_mods13, vehicle_mods14, vehicle_mods15, vehicle_mods16, vehicle_turbo, vehicle_tiresmoke, vehicle_xenon, vehicle_mods23, vehicle_mods24, vehicle_neon0, vehicle_neon1, vehicle_neon2, vehicle_neon3, vehicle_bulletproof, vehicle_smokecolor1, vehicle_smokecolor2, vehicle_smokecolor3, vehicle_modvariation) -- vtype is the vehicle type (one vehicle per type allowed at the same time)

  local vehicle = vehicles[vtype]
  if vehicle and not IsVehicleDriveable(vehicle[3]) then -- precheck if vehicle is undriveable
    -- despawn vehicle
    SetVehicleHasBeenOwnedByPlayer(vehicle[3],false)
    Citizen.InvokeNative(0xAD738C3085FE7E11, vehicle[3], false, true) -- set not as mission entity
    SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(vehicle[3]))
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle[3]))
    TriggerEvent("vrp_garages:setVehicle", vtype, nil)
  end

  vehicle = vehicles[vtype]
  if vehicle == nil then
    -- load vehicle model
    local mhash = GetHashKey(name)

    local i = 0
    while not HasModelLoaded(mhash) and i < 10000 do
      RequestModel(mhash)
      Citizen.Wait(10)
      i = i+1
    end

    -- spawn car
    if HasModelLoaded(mhash) then
      local x,y,z = vRP.getPosition({})
      local nveh = CreateVehicle(mhash, x,y,z+0.5, GetEntityHeading(GetPlayerPed(-1)), true, false) -- added player heading
      SetVehicleOnGroundProperly(nveh)
      SetEntityInvincible(nveh,false)
      SetPedIntoVehicle(GetPlayerPed(-1),nveh,-1) -- put player inside
      SetVehicleNumberPlateText(nveh, "P " .. vRP.getRegistrationNumber({}))
      Citizen.InvokeNative(0xAD738C3085FE7E11, nveh, true, true) -- set as mission entity
      SetVehicleHasBeenOwnedByPlayer(nveh,true)
      vehicle_migration = false
      if not vehicle_migration then
        local nid = NetworkGetNetworkIdFromEntity(nveh)
        SetNetworkIdCanMigrate(nid,false)
      end

      TriggerEvent("vrp_garages:setVehicle", vtype, {vtype,name,nveh})

      SetModelAsNoLongerNeeded(mhash)
      --kralle sutter mega meget
      --grabbing customization
      local plate = plate
      local primarycolor = tonumber(vehicle_colorprimary)
      local secondarycolor = tonumber(vehicle_colorsecondary)
      local pearlescentcolor = vehicle_pearlescentcolor
      local wheelcolor = vehicle_wheelcolor
      local plateindex = tonumber(vehicle_plateindex)
      local neoncolor = {vehicle_neoncolor1,vehicle_neoncolor2,vehicle_neoncolor3}
      local windowtint = vehicle_windowtint
      local wheeltype = tonumber(vehicle_wheeltype)
      local mods0 = tonumber(vehicle_mods0)
      local mods1 = tonumber(vehicle_mods1)
      local mods2 = tonumber(vehicle_mods2)
      local mods3 = tonumber(vehicle_mods3)
      local mods4 = tonumber(vehicle_mods4)
      local mods5 = tonumber(vehicle_mods5)
      local mods6 = tonumber(vehicle_mods6)
      local mods7 = tonumber(vehicle_mods7)
      local mods8 = tonumber(vehicle_mods8)
      local mods9 = tonumber(vehicle_mods9)
      local mods10 = tonumber(vehicle_mods10)
      local mods11 = tonumber(vehicle_mods11)
      local mods12 = tonumber(vehicle_mods12)
      local mods13 = tonumber(vehicle_mods13)
      local mods14 = tonumber(vehicle_mods14)
      local mods15 = tonumber(vehicle_mods15)
      local mods16 = tonumber(vehicle_mods16)
      local turbo = vehicle_turbo
      local tiresmoke = vehicle_tiresmoke
      local xenon = vehicle_xenon
      local mods23 = tonumber(vehicle_mods23)
      local mods24 = tonumber(vehicle_mods24)
      local neon0 = vehicle_neon0
      local neon1 = vehicle_neon1
      local neon2 = vehicle_neon2
      local neon3 = vehicle_neon3
      local bulletproof = vehicle_bulletproof
      local smokecolor1 = vehicle_smokecolor1
      local smokecolor2 = vehicle_smokecolor2
      local smokecolor3 = vehicle_smokecolor3
      local variation = vehicle_modvariation

      --setting customization
      SetVehicleColours(nveh, primarycolor, secondarycolor)
      SetVehicleExtraColours(nveh, tonumber(pearlescentcolor), tonumber(wheelcolor))
      SetVehicleNumberPlateTextIndex(nveh,plateindex)
      SetVehicleNeonLightsColour(nveh,tonumber(neoncolor[1]),tonumber(neoncolor[2]),tonumber(neoncolor[3]))
      SetVehicleTyreSmokeColor(nveh,tonumber(smokecolor1),tonumber(smokecolor2),tonumber(smokecolor3))
      SetVehicleModKit(nveh,0)
      SetVehicleMod(nveh, 0, mods0)
      SetVehicleMod(nveh, 1, mods1)
      SetVehicleMod(nveh, 2, mods2)
      SetVehicleMod(nveh, 3, mods3)
      SetVehicleMod(nveh, 4, mods4)
      SetVehicleMod(nveh, 5, mods5)
      SetVehicleMod(nveh, 6, mods6)
      SetVehicleMod(nveh, 7, mods7)
      SetVehicleMod(nveh, 8, mods8)
      SetVehicleMod(nveh, 9, mods9)
      SetVehicleMod(nveh, 10, mods10)
      SetVehicleMod(nveh, 11, mods11)
      SetVehicleMod(nveh, 12, mods12)
      SetVehicleMod(nveh, 13, mods13)
      SetVehicleMod(nveh, 14, mods14)
      SetVehicleMod(nveh, 15, mods15)
      SetVehicleMod(nveh, 16, mods16)
      if turbo == "on" then
        ToggleVehicleMod(nveh, 18, true)
      else
        ToggleVehicleMod(nveh, 18, false)
      end
      if tiresmoke == "on" then
        ToggleVehicleMod(nveh, 20, true)
      else
        ToggleVehicleMod(nveh, 20, false)
      end
      if xenon == "on" then
        ToggleVehicleMod(nveh, 22, true)
      else
        ToggleVehicleMod(nveh, 22, false)
      end
      SetVehicleWheelType(nveh, tonumber(wheeltype))
      SetVehicleMod(nveh, 23, mods23)
      SetVehicleMod(nveh, 24, mods24)
      if neon0 == "on" then
        SetVehicleNeonLightEnabled(nveh,0, true)
      else
        SetVehicleNeonLightEnabled(nveh,0, false)
      end
      if neon1 == "on" then
        SetVehicleNeonLightEnabled(nveh,1, true)
      else
        SetVehicleNeonLightEnabled(nveh,1, false)
      end
      if neon2 == "on" then
        SetVehicleNeonLightEnabled(nveh,2, true)
      else
        SetVehicleNeonLightEnabled(nveh,2, false)
      end
      if neon3 == "on" then
        SetVehicleNeonLightEnabled(nveh,3, true)
      else
        SetVehicleNeonLightEnabled(nveh,3, false)
      end
      if bulletproof == "on" then
        SetVehicleTyresCanBurst(nveh, false)
      else
        SetVehicleTyresCanBurst(nveh, true)
      end
      --if variation == "on" then
      --  SetVehicleModVariation(nveh,23)
      --else
      --  SetVehicleModVariation(nveh,23, false)
      --end
      SetVehicleWindowTint(nveh,tonumber(windowtint))
    end
  else
    vRP.notify({"Du kan kun have et køretøj ude."})
  end
end

function vRPgt.spawnBoughtVehicle(vtype, name)

  local vehicle = vehicles[vtype]
  if vehicle then -- precheck if vehicle is undriveable
    -- despawn vehicle
    SetVehicleHasBeenOwnedByPlayer(vehicle[3],false)
    Citizen.InvokeNative(0xAD738C3085FE7E11, vehicle[3], false, true) -- set not as mission entity
    SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(vehicle[3]))
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle[3]))
    TriggerEvent("vrp_garages:setVehicle", vtype, nil)
  end

  vehicle = vehicles[vtype]
  if vehicle == nil then
    -- load vehicle model
    local mhash = GetHashKey(name)

    local i = 0
    while not HasModelLoaded(mhash) and i < 10000 do
      RequestModel(mhash)
      Citizen.Wait(10)
      i = i+1
    end

    -- spawn car
    if HasModelLoaded(mhash) then
      local x,y,z = vRP.getPosition({})
      local nveh = CreateVehicle(mhash, x,y,z+0.5, GetEntityHeading(GetPlayerPed(-1)), true, false) -- added player heading
      SetVehicleOnGroundProperly(nveh)
      SetEntityInvincible(nveh,false)
      SetPedIntoVehicle(GetPlayerPed(-1),nveh,-1) -- put player inside
      SetVehicleNumberPlateText(nveh, "P " .. vRP.getRegistrationNumber({}))
      Citizen.InvokeNative(0xAD738C3085FE7E11, nveh, true, true) -- set as mission entity
      SetVehicleHasBeenOwnedByPlayer(nveh,true)
      vehicle_migration = false
      if not vehicle_migration then
        local nid = NetworkGetNetworkIdFromEntity(nveh)
        SetNetworkIdCanMigrate(nid,false)
      end

      TriggerEvent("vrp_garages:setVehicle", vtype, {vtype,name,nveh})

      SetModelAsNoLongerNeeded(mhash)
    end
  else
    -- vRP.notify({"You can only have one "..vtype.." vehicule out."})
    TriggerEvent("pNotify:SendNotification",{
      text = "Du kan kun have en "..vtype.." ude ad gangen.",
      type = "info",
      timeout = (2000),
      layout = "bottomCenter",
      queue = "global",
      animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
      killer = false
    })
  end
end

function vRPgt.despawnGarageVehicle(vtype,max_range)
  local vehicle = vehicles[vtype]
  local user_id = vRP.getUserId({source})
  local vehicle1 = GetVehiclePedIsIn(GetPlayerPed(-1), false)
 -- local pris = math.ceil(((1000 - GetVehicleBodyHealth(vehicle1)) * 5) + (1000 - GetVehicleEngineHealth(vehicle1)) * 7.5)
  if vehicle then
    local x,y,z = table.unpack(GetEntityCoords(vehicle[3],true))
    local px,py,pz = vRP.getPosition()

    if GetDistanceBetweenCoords(x,y,z,px,py,pz,true) < max_range then -- check distance with the vehicule
      -- remove vehicle
      SetVehicleHasBeenOwnedByPlayer(vehicle[3],false)
      Citizen.InvokeNative(0xAD738C3085FE7E11, vehicle[3], false, true) -- set not as mission entity
      SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(vehicle[3]))
      Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle[3]))
      TriggerEvent("vrp_garages:setVehicle", vtype, nil)
        --vRP.tryFullPayment({user_id,pris})
        TriggerEvent("pNotify:SendNotification",{
        text = "køretøjet er gemt!",
         -- text = "Køretøjet er gemt",
          type = "info",
          timeout = (2000),
          layout = "bottomCenter",
          queue = "global",
          animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
          killer = false
        })
      else
        TriggerEvent("pNotify:SendNotification",{
          text = "Du er ikke i nærheden af et køretøj",
          type = "error",
          timeout = (2000),
          layout = "bottomCenter",
          queue = "global",
          animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
          killer = false
        })
      end
    end
  end

  function MenuGarage()
    ped = GetPlayerPed(-1)
    selectedPage = 0
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton(lang_string.menu11,"CloseMenu",nil)
    Menu.addButton(lang_string.menu2,"ListVehicle",selectedPage)
    Menu.addButton(lang_string.menu3,"CloseMenu",nil)
  end


  function Gembil()
    Citizen.CreateThread(function()
    local user_id = vRP.getUserId(player)
    local ped = GetPlayerPed(-1)
    local caissei = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    SetEntityAsMissionEntity(caissei, true, true)
    local plate = GetVehicleNumberPlateText(caissei)
    local vtype = "car"
    if IsThisModelABike(GetEntityModel(caissei)) then
      vtype = "bike"
    end
    if DoesEntityExist(caissei) then
      TriggerServerEvent('ply_garages:CheckForVeh', plate, vehicles[vtype][2],vtype)
    else
      TriggerEvent("pNotify:SendNotification",{text = "Intet køretøj ude",type = "info",timeout = (2000), theme = "gta", layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
    end)
  end


  function StoreVehicle()
    Citizen.CreateThread(function()
    local caissei = GetClosestVehicle(garageSelected.x, garageSelected.y, garageSelected.z, 3.000, 0, 70)
    SetEntityAsMissionEntity(caissei, true, true)
    local plate = GetVehicleNumberPlateText(caissei)
    local vtype = "car"
    if IsThisModelABike(GetEntityModel(caissei)) then
      vtype = "bike"
    end
    if DoesEntityExist(caissei) then
      local damage = GetEntityHealth(GetClosestVehicle(garageSelected.x, garageSelected.y, garageSelected.z, 3.000, 0, 70))
      local windows = AreAllVehicleWindowsIntact(GetClosestVehicle(garageSelected.x, garageSelected.y, garageSelected.z, 3.000, 0, 70))
      if damage <850 or windows == false then
        TriggerEvent("pNotify:SendNotification",{text = "Dit køretøj er skadet, ring til en mekaniker!",type = "info",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      else
        TriggerServerEvent('ply_garages:CheckForVeh', plate, vehicles[vtype][2],vtype)
      end
    else
      TriggerEvent("pNotify:SendNotification",{text = "Intet køretøj ude",type = "info",timeout = (2000), theme = "gta", layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
    end)
    CloseMenu()
  end
  function ListVehicle(page)
    ped = GetPlayerPed(-1)
    selectedPage = page
    MenuTitle = lang_string.menu4
    ClearMenu()
    local count = 0
    for ind, value in pairs(GVEHICLES) do
      if ((count >= (page*10)) and (count < ((page*10)+10))) then
        Menu.addButton(tostring(value.vehicle_name), "OptionVehicle", value.vehicle_name)
      end
      count = count + 1
    end
    Menu.addButton(lang_string.menu12,"ListVehicle",page+1)
    if page == 0 then
      Menu.addButton(lang_string.menu7,"MenuGarage",nil)
    else
      Menu.addButton(lang_string.menu7,"ListVehicle",page-1)
    end
  end

  function OptionVehicle(vehID)
    local vehID = vehID
    MenuTitle = "Options"
    ClearMenu()
    Menu.addButton(lang_string.menu6, "SpawnVehicle", vehID)
    Menu.addButton(lang_string.menu7, "ListVehicle", selectedPage)
  end

  function SpawnVehicle(vehID)
    local vehID = vehID
    TriggerServerEvent('ply_garages:CheckForSpawnVeh', vehID)
    CloseMenu()
  end


  function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
  end

  function CloseMenu()
    Menu.hidden = true
    TriggerServerEvent("ply_garages:CheckGarageForVeh")
  end

  function LocalPed()
    return GetPlayerPed(-1)
  end

  function IsPlayerInRangeOfGarage()
    return inrangeofgarage
  end

  function Chat(debugg)
    TriggerEvent("chatMessage", '', { 0, 0x99, 255 }, tostring(debugg))
  end

  --[[function ply_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
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
  end]]

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
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 100)
  end


  --[[Citizen]]--

  Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for _, garage in pairs(garages) do
      DrawMarker(27, garage.x, garage.y, garage.z, 0, 0, 0, 0, 0, 0, 3.001, 3.0001, 0.5001, 101, 153, 186, 200, 0, 1, 0, 50)
      if GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(LocalPed())) < 3 and IsPedInAnyVehicle(LocalPed(), true) == false then
        DrawText3Ds(garage.x, garage.y, garage.z + 1, "Tryk ~g~E~w~ for at åbne garagen.")
        --elseif GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(LocalPed())) < 3 then
        --   DrawText3Ds(garage.x, garage.y, garage.z, "Stig ud af dit fucking køretøj.")
        if IsControlJustPressed(1, 38) then
          garageSelected.x = garage.x
          garageSelected.y = garage.y
          garageSelected.z = garage.z
          MenuGarage()
          Menu.hidden = not Menu.hidden
        end
        Menu.renderGUI()
      end
    end
  end
  end)


  Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for _, garage in pairs(garages) do
      DrawMarker(27, garage.x, garage.y, garage.z, 0, 0, 0, 0, 0, 0, 3.001, 3.0001, 0.5001, 101, 153, 186, 200, 0, 1, 0, 50)
      if GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(LocalPed())) < 3 and IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
        DrawText3Ds(garage.x, garage.y, garage.z + 1, "Tryk ~g~E~w~ for at opbevare køretøjet.")
        --elseif GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(LocalPed())) < 3 then
        --   DrawText3Ds(garage.x, garage.y, garage.z, "Stig ud af dit fucking køretøj.")
        if IsControlJustPressed(1, 38) then
          garageSelected.x = garage.x
          garageSelected.y = garage.y
          garageSelected.z = garage.z
          Gembil()
        end
      end
    end
  end
  end)



  Citizen.CreateThread(function()
  while true do
    local near = false
    Citizen.Wait(0)
    for _, garage in pairs(garages) do
      if (GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(LocalPed())) < 3 and near ~= true) then
        near = true
      end
    end
    if near == false then
      Menu.hidden = true
    end
  end
  end)

  Citizen.CreateThread(function()
  for _, item in pairs(garages) do
    item.blip = AddBlipForCoord(item.x, item.y, item.z)
    SetBlipSprite(item.blip, item.id)
    SetBlipAsShortRange(item.blip, true)
    SetBlipColour(item.blip, item.colour)
	SetBlipScale(item.blip,0.6)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(item.name)
    EndTextCommandSetBlipName(item.blip)
  end
  end)

  --[[Events]]--

  RegisterNetEvent('vrp_garages:setVehicle')
  AddEventHandler('vrp_garages:setVehicle', function(vtype, vehicle)
  vehicles[vtype] = vehicle
  end)

  RegisterNetEvent('ply_garages:addAptGarage')
  AddEventHandler('ply_garages:addAptGarage', function(gx,gy,gz,gh)
  local alreadyExists = false
  for _, garage in pairs(garages) do
    if garage.x == gx and garage.y == gy then
      alreadyExists = true
    end
  end
  if not alreadyExists then
    table.insert(garages, #garages + 1, {name="Apartment Garage", colour=3, id=357, x=gx, y=gy, z=gz, h=gh})
  end
  end)

  RegisterNetEvent('ply_garages:getVehicles')
  AddEventHandler("ply_garages:getVehicles", function(THEVEHICLES)
  GVEHICLES = {}
  GVEHICLES = THEVEHICLES
  end)

  AddEventHandler("playerSpawned", function()
  TriggerServerEvent("ply_garages:CheckGarageForVeh")
  TriggerServerEvent("ply_garages:CheckForAptGarages")
  end)
