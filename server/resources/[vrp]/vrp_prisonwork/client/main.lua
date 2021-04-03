vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_prisonwork")

local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}


local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local HashKeyBox = GetHashKey("prop_paper_box_02")
local HashKeyOpenBox = GetHashKey("prop_paper_box_01")
local CanLeaveBox			  = false
local IsInJob				  = false
local TimeLeft				  = 0
local fastTimer 			  = 0

local GUI = {}
GUI.Time                      = 0
local PlayerData              = {}

RegisterNetEvent('playerLoaded')
AddEventHandler('playerLoaded', function(player)
  PlayerData = player
end)

RegisterNetEvent('setJob')
AddEventHandler('vRP:setJob', function(job)
  PlayerData.job = job
end)

AddEventHandler('vRP:hasEnteredMarker', function (zone)
  if zone == 'StartJob' then
    CurrentAction     = 'start_job'
	CurrentActionMsg  = ('Tryk ~INPUT_CONTEXT~ for at lave en pakke')
    CurrentActionData = {}
  elseif zone == 'LeaveBox' then
    CurrentAction	  = 'leave_box'
	CurrentActionMsg  = ('Tryk ~INPUT_CONTEXT~ for at aflevere pakken.')
	CurrentActionData = {}
  elseif zone == 'TeleportIn' then
    CurrentAction	  = 'teleport_in'
	CurrentActionMsg  = ('Press ~INPUT_CONTEXT~ to go to Workshop.')
	CurrentActionData = {}
  elseif zone == 'TeleportUd' then
    CurrentAction	  = 'teleport_ut'
	CurrentActionMsg  = ('Press ~INPUT_CONTEXT~ to go out from the Workshop.')
	CurrentActionData = {}
  end
end)

-- 

AddEventHandler('vRP:hasExitedMarker', function (zone)
  CurrentAction = nil
end)


Citizen.CreateThread(function()
  while true do

    Citizen.Wait(0)

  if CurrentAction ~= nil then

    SetTextComponentFormat('STRING')
    AddTextComponentString(CurrentActionMsg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)

    if IsControlPressed(0,  Keys['E']) then
        if CurrentAction == 'leave_box' then
		  if CanLeaveBox == true then
		  IsInJob = false
		  TriggerServerEvent('vRP:Pay')
		  Citizen.Wait(1000)
		  CanLeaveBox = false
		  else
		TriggerEvent('vRP:hasExitedMarker', LeaveBox)
        HasAlreadyEnteredMarker = false
		CurrentAction = nil
			TriggerEvent("pNotify:SetQueueMax", "loffe", 1)
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Sikkerhedsvagt » Du har ikke nogen pakke.'),
			type = "error",
			timeout = (3500),
			layout = "bottomCenter",
			queue = "loffe",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
		Citizen.Wait(5000) 
        end 
		end
		
        if CurrentAction == 'start_job' then
			if IsInJob == false then
			IsInJob = true
            TriggerEvent('vRP:startJob')
			else

			end
          end
		  
		 if CurrentAction == 'teleport_in' then
			Citizen.Wait(1000)
           SetEntityCoords(GetPlayerPed(-1), 994.18, -3097.88, -39.85)
			SetEntityHeading(GetPlayerPed(-1), 182.46)
          end
		 if CurrentAction == 'teleport_ud' then
		 Citizen.Wait(1000)
           SetEntityCoords(GetPlayerPed(-1), 1798.39, 2482.91, -123.54)
			SetEntityHeading(GetPlayerPed(-1), 96.43)
          end
      end
    end
  end
end)

Citizen.CreateThread(function ()
  while true do
    Wait(0)

    local coords = GetEntityCoords(GetPlayerPed(-1))

    for k,v in pairs(Config.Zones) do
      if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
        DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0, 0, 0, 0, 0, 0, 1.2, 1.2, 1.0, v.Color.r, v.Color.g, v.Color.b, 200, 0, 0, 1, 0.5)--DrawMarker(27, v.Pos.x, v.Pos.y, v.Pos.z-1.0, 0, 0, 0, 0, 0, 0, 1.2, 1.2, 1.0, v.Color.r, v.Color.g, v.Color.b, 200, 0, 0, 1, 0.5) --DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
      end
    end
  end
end)

Citizen.CreateThread(function ()
  while true do
    Wait(0)

    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local isInMarker  = false
    local currentZone = nil

    for k,v in pairs(Config.Zones) do
      if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
        isInMarker  = true
        currentZone = k
      end
    end

    if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
      HasAlreadyEnteredMarker = true
      LastZone                = currentZone
      TriggerEvent('vRP:hasEnteredMarker', currentZone)
    end

    if not isInMarker and HasAlreadyEnteredMarker then
	  TriggerEvent('vRP:hasExitedMarker', LastZone)
      HasAlreadyEnteredMarker = false
    end
  end
end)

RegisterNetEvent("vRP:missiontext") 
AddEventHandler("vRP:missiontext", function(text, time)
        ClearPrints()
        SetTextEntry_2("STRING")
        AddTextComponentString(text)
        DrawSubtitleTimed(time, 1)
end)

RegisterNetEvent('vRP:startJob')
AddEventHandler('vRP:startJob', function()
    local pP = GetPlayerPed(-1)  
	local SpawnObject = CreateObject(HashKeyOpenBox, 1021.75, -3111.36, -39.85)
	SetEntityCoords(GetPlayerPed(-1), 1021.8, -3110.83, -39.85) 
	SetEntityHeading(GetPlayerPed(-1), 182.46)
    TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
	CanLeaveBox = true
	TimeLeft = Config.TimeToPackBox
	repeat
	TriggerEvent("vRP:missiontext", '~w~Indsamling af pakke. Tid tilbage: ~r~' .. TimeLeft .. ' ~w~sekunder', 1000)
	TimeLeft = TimeLeft - 1
	Citizen.Wait(1000)
	until(TimeLeft == 0)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	DeleteEntity(SpawnObject)
	CanLeaveBox = true
	local playerPed = GetPlayerPed(-1)
	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	local prop = CreateObject(HashKeyBox, x+5.5, y+5.5, z+0.2,  true,  true, true)
	AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 11816), -0.2, 0.38, 0.001, 10.0, 285.0, 270.0, true, true, false, true, 1, true)
	RequestAnimDict('anim@heists@box_carry@')
	while not HasAnimDictLoaded('anim@heists@box_carry@') do
    Wait(0)
	end
	TaskPlayAnim(playerPed, 'anim@heists@box_carry@', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
	repeat
	Citizen.Wait(1000)
	if CanLeaveBox == false then
	DeleteEntity(prop)
	ClearPedTasksImmediately(pP)
	end
	until(CanLeaveBox == false)
end)

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextDropshadow(0, 0, 0, 155)
	SetTextEdge(1, 0, 0, 0, 250)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 370
	DrawRect(_x,_y+0.0125, 0.015+factor, 0.03, 41, 41, 41, 68)
end


--[[
--]]
