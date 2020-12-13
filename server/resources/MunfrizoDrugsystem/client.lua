---------------------------------------
--------- Base By MunFrizo ------------
---------- Edits by Ossie -------------
----------- DevoNetwork ---------------
---------------------------------------                                                                                                    
                                                                                                             
							   

vRP = Proxy.getInterface("vRP")  



local kokain = {
  {name="kokain", id=0, x=356.82869262695, y=6476.0708007813, z=29.729650497437}, -- 356.62869262695,6476.0708007813,29.729650497437
  {name="kokain", id=0, x=357.08402709961, y=6483.562109375, z=29.795503616333},
  {name="kokain", id=0, x=357.08298950195, y=6482.2177734375, z=29.625259399414},
  {name="kokain", id=0, x=356.98886108398, y=6480.2297851563, z=29.7177318573}, -- 357.31161499023,6478.7963867188,29.546674728394
  {name="kokain", id=0, x=357.07041625977, y=6477.6000976563, z=29.625217437744}, -- 357.27041625977,6477.6000976563,29.625217437744
  {name="kokain", id=0, x=357.06697387695, y=6478.7061523438, z=29.54514503479}, -- 357.36697387695,6478.8061523438,29.54514503479
}

local hash = {
  {name="hash", id=0, x=2215.90849804688, y=5575.3046875, z=53.702610015869}, -- 2216.2299804688,5575.3046875,53.702610015869
  {name="hash", id=0, x=2216.2457519531, y=5577.52734375, z=53.844551086426}, -- 2216.6457519531,5577.52734375,53.844551086426
  {name="hash", id=0, x=2218.2796875, y=5575.1333007813, z=53.723117828369}, -- 2218.6796875,5575.1333007813,53.723117828369
  {name="hash", id=0, x=2218.5030761719, y=5577.2446289063, z=53.854076385498}, -- 2218.9030761719,5577.2446289063,53.854076385498
  {name="hash", id=0, x=2218.9251953125, y=5579.4858398438, z=53.963363647461}, -- 2219.3251953125,5579.4858398438,53.963363647461
}

local syre = {
  {name="syre", id=0, x=1928.7174072266, y=592.57464599609, z=175.66258239746}, 
}

local blomster = {
  {name="blomster", id=0, x=254.57788085938, y=3579.6354980469, z=34.024013519287}, -- 254.57788085938,3579.6354980469,34.024013519287
  {name="blomster", id=0, x=253.25810241699, y=3576.9521484375, z=33.8776512146}, -- 253.25810241699,3576.9521484375,33.8776512146
  {name="blomster", id=0, x=248.05781555176, y=3575.3774414063, z=34.083805084229}, -- 248.05781555176,3575.3774414063,34.083805084229
  {name="blomster", id=0, x=251.02589416504, y=3570.939453125, z=34.158889770508}, -- 251.02589416504,3570.939453125,34.158889770508
}

local aluminium = {
  {name="aluminium", id=0, x=2995.2092285156, y=2754.4985351563, z=43.069381713867},
}

local guld = { 
  {name="guld", id=0, x=2997.8757324219, y=2757.3859863281, z=42.969573974609},
}

local stol = { 
  {name="stol", id=0, x=2988.2131347656, y=2755.5251464844, z=42.707836151123},
}

local kul = { 
  {name="kul", id=0, x=2912.7639160156, y=2784.1264648438, z=44.68078994751},
}




function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 5 )
	end
end 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                   -- Kokain -- 
                                                                                   local collect = false
                                                                                   local collect2 = false
                                                                                   local collect3 = false
                                                                                   local collect4 = false

                                                                                   Citizen.CreateThread(function()
                                                                                       while true do
                                                                                           if collect then
                                                                                               DisableControlAction(0,51,true)
                                                                                               DisableControlAction(0,20,true)
                                                                                               DisableControlAction(0,38,true)
                                                                                               Wait(0)
                                                                                           else
                                                                                               Wait(250)
                                                                                           end
                                                                                       end
                                                                                   end)

                                                                                   Citizen.CreateThread(function()
                                                                                    while true do
                                                                                        if collect2 then
                                                                                            DisableControlAction(0,44,true)
                                                                                            DisableControlAction(0,20,true)
                                                                                            DisableControlAction(0,23,true)
                                                                                            Wait(0)
                                                                                        else
                                                                                            Wait(250)
                                                                                        end
                                                                                    end
                                                                                end)

                                                                                
                                                                                Citizen.CreateThread(function()
                                                                                  while true do
                                                                                      if collect3 then
                                                                                          DisableControlAction(0,44,true)
                                                                                          DisableControlAction(0,51,true)
                                                                                          DisableControlAction(0,20,true)
                                                                                          Wait(0)
                                                                                      else
                                                                                          Wait(250)
                                                                                      end
                                                                                  end
                                                                              end)

                                                                              Citizen.CreateThread(function()
                                                                                while true do
                                                                                    if collect4 then
                                                                                        DisableControlAction(0,23,true)
                                                                                        DisableControlAction(0,51,true)
                                                                                        DisableControlAction(0,20,true)
                                                                                        Wait(0)
                                                                                    else
                                                                                        Wait(250)
                                                                                    end
                                                                                end
                                                                            end)

                                                                                Citizen.CreateThread(function()
                                                                                  while true do
                                                                                      Citizen.Wait(0)
                                                                                  local ply = GetPlayerPed(-1)
                                                                                  local plyCoords = GetEntityCoords(ply, 0)
                                                                                      for _, sted in pairs(kokain) do
                                                                                  local distance = GetDistanceBetweenCoords(sted.x, sted.y, sted.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
                                                                                      if(distance <= 1) then
                                                                                 
                                                                                      DrawText3D(sted.x, sted.y, sted.z, "~b~[E]~s~ - Høst Kokain")
                                                                                          if(IsControlJustReleased(1, 51))then
                                                                                          --isfarmingkoka = true
                                                                                    collect2 = true
                                                                                          exports['progressBars']:startUI(10000, "Høster Kokain")
                                                                                          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                                                          Citizen.Wait(10000)
                                                                                          ClearPedTasksImmediately(GetPlayerPed(-1))
                                                                                          TriggerServerEvent('kokain')
                                                                                    collect2 = false
                                                                                      end
                                                                                   end
                                                                                  end
                                                                              end
                                                                              end)

                                                                                   
                                                                                   Citizen.CreateThread(function()
                                                                                       while true do
                                                                                           Citizen.Wait(0)
                                                                                       local ply = GetPlayerPed(-1)
                                                                                       local plyCoords = GetEntityCoords(ply, 0)
                                                                                           for _, sted in pairs(kokain) do
                                                                                       local distance = GetDistanceBetweenCoords(sted.x, sted.y, sted.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
                                                                                           if(distance <= 1) then
                                                                                      
                                                                                           DrawText3D(sted.x, sted.y, sted.z + 0.06, "~b~[Q]~s~ - Høst Kokain (~r~x10~w~)")
                                                                                               if(IsControlJustReleased(1, 44))then
                                                                                               --isfarmingkoka = true
                                                                                         collect = true
                                                                                               exports['progressBars']:startUI(100000, "Høster Kokain (x10)")
                                                                                               TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                                                               Citizen.Wait(100000)
                                                                                               ClearPedTasksImmediately(GetPlayerPed(-1))
                                                                                               TriggerServerEvent('kokain2')
                                                                                         collect = false
                                                                                           end
                                                                                        end
                                                                                       end
                                                                                   end
                                                                                   end)
                                                                                  

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(0) 
    local player = GetPlayerPed(-1)
    local coord = GetEntityCoords(player)
    if GetDistanceBetweenCoords(1392.3264160156,3605.9270019531,38.94193649292, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then

         DrawText3D(1392.3264160156,3605.9270019531,38.94193649292, "~b~[E]~s~ - Fremstil Kokain")
         if(IsControlJustReleased(1, 51))then
          collect2 = true
          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
         exports['progressBars']:startUI(10000, "Fremstiller Kokain")
         Citizen.Wait(10000)
         ClearPedTasksImmediately(GetPlayerPed(-1))
         TriggerServerEvent('Fremstill')
         collect2 = false
     
        
        end
      end
    end
end)       

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(0) 
    local player = GetPlayerPed(-1)
    local coord = GetEntityCoords(player)
    if GetDistanceBetweenCoords(1392.3264160156,3605.9270019531,38.94193649292, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then

         DrawText3D(1392.3264160156,3605.9270019531,38.94193649292 + 0.06, "~b~[Q]~s~ - Fremstil Kokain (~r~x10~w~)")
         if(IsControlJustReleased(1, 44))then
          collect = true
          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
         exports['progressBars']:startUI(100000, "Fremstiller Kokain x10")
         Citizen.Wait(100000)
         ClearPedTasksImmediately(GetPlayerPed(-1))
         TriggerServerEvent('Fremstill2')
         collect = false
     
        
        end
      end
    end
end)   

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(0) 
    local player = GetPlayerPed(-1)
    local coord = GetEntityCoords(player)
    if GetDistanceBetweenCoords(-1622.6534423828,-994.30645751953,7.6779065132141, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then

         DrawText3D(-1622.6534423828,-994.30645751953,7.6779065132141, "~b~[E]~s~ - Sælg Kokain")
         if(IsControlJustReleased(1, 51))then
          collect2 = true
          loadAnimDict("mp_common")
        TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
         exports['progressBars']:startUI(10000, "Sælger Kokain")
         Citizen.Wait(10000)
         ClearPedTasksImmediately(GetPlayerPed(-1))
         TriggerServerEvent('saalg')
         collect2 = false
     
         
        end
      end
    end
end)

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(0) 
    local player = GetPlayerPed(-1)
    local coord = GetEntityCoords(player)
    if GetDistanceBetweenCoords(-1622.6534423828,-994.30645751953,7.2779065132141 + 0.06, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then

         DrawText3D(-1622.6534423828,-994.30645751953,7.6779065132141 + 0.06, "~b~[Q]~s~ - Sælg Kokain (~r~x10~w~)")
         if(IsControlJustReleased(1, 44))then
          collect = true
          loadAnimDict("mp_common")
        TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
         exports['progressBars']:startUI(100000, "Sælger Kokain x10")
         Citizen.Wait(100000)
         ClearPedTasksImmediately(GetPlayerPed(-1))
         TriggerServerEvent('saalg2')
         collect = false
     
         
        end
      end
    end
end)
---------------------------------------------------------------------------------------------------------------------------------------
                                               -- Hamplade/skunk --
                           
      Citizen.CreateThread(function()
                    while true do 
                     Citizen.Wait(0) 
                    local ply = GetPlayerPed(-1)
                  local plyCoords = GetEntityCoords(ply, 0)
               for _, item in pairs(hash) do
               local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
                if(distance <= 1) then
          DrawText3D(item.x, item.y, item.z, "~b~[E]~s~ - Høst Hamplade")
         if(IsControlJustReleased(1, 51))then
          collect2 = true
          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
         exports['progressBars']:startUI(7000, "Høster Hamplade")
         Citizen.Wait(7000)
         ClearPedTasksImmediately(GetPlayerPed(-1))
         TriggerServerEvent('LavHash')
         collect2 = false
     
         end
        end
      end
    end
end)    

Citizen.CreateThread(function()
  while true do 
   Citizen.Wait(0) 
  local ply = GetPlayerPed(-1)
local plyCoords = GetEntityCoords(ply, 0)
for _, item in pairs(hash) do
local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
if(distance <= 1) then
DrawText3D(item.x, item.y, item.z + 0.06, "~b~[Q]~s~ - Høst Hamplade (~r~x10~w~)")
if(IsControlJustReleased(1, 44))then
collect = true
TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
exports['progressBars']:startUI(70000, "Høster Hamplade")
Citizen.Wait(70000)
ClearPedTasksImmediately(GetPlayerPed(-1))
TriggerServerEvent('LavHash2')
collect = false
end
end
end
end
end)

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(0) 
    local player = GetPlayerPed(-1)
    local coord = GetEntityCoords(player)
    if GetDistanceBetweenCoords(2432.9777832031,4969.4848632813,43.400890350342, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then

         DrawText3D(2432.9777832031,4969.4848632813,43.400890350342, "~b~[E]~s~ - Tør Hamplade")
         if(IsControlJustReleased(1, 51))then
          collect2 = true
          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
         exports['progressBars']:startUI(7000, "Tørrer Hamplade")
         Citizen.Wait(7000)
         ClearPedTasksImmediately(GetPlayerPed(-1))
         TriggerServerEvent('FremstillHash')
         collect2 = false
        
        end
      end
    end
end)  

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(0) 
    local player = GetPlayerPed(-1)
    local coord = GetEntityCoords(player)
    if GetDistanceBetweenCoords(2432.9777832031,4969.4848632813,43.400890350342, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then

         DrawText3D(2432.9777832031,4969.4848632813,43.400890350342 + 0.06, "~b~[Q]~s~ - Tør Hamplade (~r~x10~w~)")
         if(IsControlJustReleased(1, 44))then
          collect = true
          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
         exports['progressBars']:startUI(70000, "Tørrer Hamplade x10")
         Citizen.Wait(70000)
         ClearPedTasksImmediately(GetPlayerPed(-1))
         TriggerServerEvent('FremstillHash2')
         collect = false
        
        end
      end
    end
end)  

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(0) 
    local player = GetPlayerPed(-1)
    local coord = GetEntityCoords(player)
    if GetDistanceBetweenCoords(225.25419616699,-1982.4621582031,19.746425628662, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then

         DrawText3D(225.25419616699,-1982.4621582031,19.746425628662, "~b~[E]~s~ - Sælg Skunk")
         collect2 = true
         if(IsControlJustReleased(1, 51))then
          loadAnimDict("mp_common")
          TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
         exports['progressBars']:startUI(7000, "Sælger Skunk")
         Citizen.Wait(7000)
         ClearPedTasksImmediately(GetPlayerPed(-1))
         TriggerServerEvent('Hsaalg')
         collect2 = false
     
        
        end
      end
    end
end)

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(0) 
    local player = GetPlayerPed(-1)
    local coord = GetEntityCoords(player)
    if GetDistanceBetweenCoords(225.25419616699,-1982.4621582031,19.746425628662, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then

         DrawText3D(225.25419616699,-1982.4621582031,19.746425628662 + 0.06, "~b~[Q]~s~ - Sælg Skunk (~r~x10~w~)")
         if(IsControlJustReleased(1, 44))then
          collect = true
          loadAnimDict("mp_common")
          TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
         exports['progressBars']:startUI(70000, "Sælger Skunk x10")
         Citizen.Wait(70000)
         ClearPedTasksImmediately(GetPlayerPed(-1))
         TriggerServerEvent('Hsaalg2')
         collect = false
     
        
        end
      end
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  -- LSD

                                                          Citizen.CreateThread(function()
                                                                    while true do 
                                                                     Citizen.Wait(0) 
                                                                    local ply = GetPlayerPed(-1)
                                                                  local plyCoords = GetEntityCoords(ply, 0)
                                                               for _, item in pairs(syre) do
                                                               local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
                                                                if(distance <= 1) then
                                                          DrawText3D(item.x, item.y, item.z, "~b~[E]~s~ - Udvind Syre")
                                                         if(IsControlJustReleased(1, 51))then
                                                          collect2 = true
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(7000, "Udvinder Syre")
                                                         Citizen.Wait(7000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('LavSyre')
                                                         collect2 = false
                                                     
                                                         end
                                                        end
                                                      end
                                                    end
                                                end)       

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                   Citizen.Wait(0) 
                                                  local ply = GetPlayerPed(-1)
                                                local plyCoords = GetEntityCoords(ply, 0)
                                             for _, item in pairs(syre) do
                                             local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
                                              if(distance <= 1) then
                                        DrawText3D(item.x, item.y, item.z + 0.06, "~b~[Q]~s~ - Udvind Syre (~r~x10~w~)")
                                       if(IsControlJustReleased(1, 44))then
                                        collect = true
                                        TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                       exports['progressBars']:startUI(70000, "Udvinder Syre x10")
                                       Citizen.Wait(70000)
                                       ClearPedTasksImmediately(GetPlayerPed(-1))
                                       TriggerServerEvent('LavSyre2')
                                       collect = false
                                   
                                       end
                                      end
                                    end
                                  end
                              end)   
                                                
                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(2356.5842285156,3131.6752929688,48.208595275879, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(2356.5842285156,3131.6752929688,48.208595275879, "~b~[E]~s~ - Fremstil LSD")
                                                         if(IsControlJustReleased(1, 51))then
                                                          collect2 = true
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(7000, "Fremstiller LSD")
                                                         Citizen.Wait(7000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('FremstillLSD')
                                                         collect2 = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)  

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(2356.5842285156,3131.6752929688,48.208595275879, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(2356.5842285156,3131.6752929688,48.208595275879 + 0.06, "~b~[Q]~s~ - Fremstil LSD (~r~x10~w~)")
                                                         if(IsControlJustReleased(1, 44))then
                                                          collect = true
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(70000, "Fremstiller LSD x10")
                                                         Citizen.Wait(70000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('FremstillLSD2')
                                                         collect = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)  
                                                
                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(-1564.3973388672,-3235.8251953125,26.336153030396, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(-1564.3973388672,-3235.8251953125,26.336153030396, "~b~[E]~s~ - Sælg LSD")
                                                         if(IsControlJustReleased(1, 51))then
                                                          collect2 = true
                                                          loadAnimDict("mp_common")
                                                          TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                         exports['progressBars']:startUI(7000, "Sælger LSD")
                                                         Citizen.Wait(7000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('LSDsaalg')
                                                         collect2 = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(-1564.3973388672,-3235.8251953125,26.336153030396, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(-1564.3973388672,-3235.8251953125,26.336153030396 + 0.06, "~b~[Q]~s~ - Sælg LSD (~r~x10~w~)")
                                                         if(IsControlJustReleased(1, 44))then
                                                          collect = true
                                                          loadAnimDict("mp_common")
                                                          TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                         exports['progressBars']:startUI(70000, "Sælger LSD x10")
                                                         Citizen.Wait(70000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('LSDsaalg2')
                                                         collect = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  -- NoAH

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(3559.2905273438,3672.0979003906,28.12188911438, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(3559.2905273438,3672.0979003906,28.12188911438, "~b~[E]~s~ - Fremstil NaOH")
                                                         if(IsControlJustReleased(1, 51))then
                                                          collect2 = true
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(10000, "Fremstiller NaOH")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('FremstillNaOH')
                                                         TriggerServerEvent('FremstillNaOH2')
                                                         collect2 = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)  

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(3559.2905273438,3672.0979003906,28.12188911438, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(3559.2905273438,3672.0979003906,28.12188911438 + 0.06, "~b~[Q]~s~ - Fremstil NaOH (~r~x10~w~)")
                                                         if(IsControlJustReleased(1, 44))then
                                                          collect = true
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(100000, "Fremstiller NaOH x10")
                                                         Citizen.Wait(100000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('FremstillNaOH21')
                                                         TriggerServerEvent('FremstillNaOH22')
                                                         collect = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)  


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  -- AMF

                                                                  Citizen.CreateThread(function()
                                                                    while true do 
                                                                      Citizen.Wait(0) 
                                                                      local player = GetPlayerPed(-1)
                                                                      local coord = GetEntityCoords(player)
                                                                      if GetDistanceBetweenCoords(1092.9554443359,-3194.8947753906,-38.993473052979, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                                  
                                                                           DrawText3D(1092.9554443359,-3194.8947753906,-38.993473052979, "~b~[E]~s~ - Fremstil Amfetamin")
                                                                           if(IsControlJustReleased(1, 51))then
                                                                            collect2 = true
                                                                            TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                                           exports['progressBars']:startUI(10000, "Fremstiller Amfetamin")
                                                                           Citizen.Wait(10000)
                                                                           ClearPedTasksImmediately(GetPlayerPed(-1))
                                                                           TriggerServerEvent('FremstillAMF')
                                                                           TriggerServerEvent('FremstillAMF1')
                                                                           TriggerServerEvent('FremstillAMF2')
                                                                           TriggerServerEvent('FremstillAMF3')
                                                                           TriggerServerEvent('FremstillAMF4')
                                                                           TriggerServerEvent('FremstillAMF5')
                                                                           collect2 = false
                                                                       
                                                                          
                                                                          end
                                                                        end
                                                                      end
                                                                  end)  

                                                                  Citizen.CreateThread(function()
                                                                    while true do 
                                                                      Citizen.Wait(0) 
                                                                      local player = GetPlayerPed(-1)
                                                                      local coord = GetEntityCoords(player)
                                                                      if GetDistanceBetweenCoords(1092.9554443359,-3194.8947753906,-38.993473052979, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                                  
                                                                           DrawText3D(1092.9554443359,-3194.8947753906,-38.993473052979 + 0.06, "~b~[Q]~s~ - Fremstil Amfetamin (~r~x10~w~)")
                                                                           if(IsControlJustReleased(1, 44))then
                                                                            collect = true
                                                                            TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                                           exports['progressBars']:startUI(100000, "Fremstiller Amfetamin")
                                                                           Citizen.Wait(100000)
                                                                           ClearPedTasksImmediately(GetPlayerPed(-1))
                                                                           TriggerServerEvent('FremstillAMF21')
                                                                           TriggerServerEvent('FremstillAMF22')
                                                                           TriggerServerEvent('FremstillAMF23')
                                                                           TriggerServerEvent('FremstillAMF24')
                                                                           TriggerServerEvent('FremstillAMF25')
                                                                           TriggerServerEvent('FremstillAMF26')
                                                                           collect = false
                                                                       
                                                                          
                                                                          end
                                                                        end
                                                                      end
                                                                  end)  
                                                                  
                                                                  Citizen.CreateThread(function()
                                                                    while true do 
                                                                      Citizen.Wait(0) 
                                                                      local player = GetPlayerPed(-1)
                                                                      local coord = GetEntityCoords(player)
                                                                      if GetDistanceBetweenCoords(-2036.3176269531,-1033.9346923828,5.8823590278625, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                                  
                                                                           DrawText3D(-2036.3176269531,-1033.9346923828,5.8823590278625, "~b~[E]~s~ - Sælg Amfetamin")
                                                                           if(IsControlJustReleased(1, 51))then
                                                                            collect2 = true
                                                                            loadAnimDict("mp_common")
                                                                            TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                                           exports['progressBars']:startUI(10000, "Sælger Amfetamin")
                                                                           Citizen.Wait(10000)
                                                                           ClearPedTasksImmediately(GetPlayerPed(-1))
                                                                           TriggerServerEvent('AMFsaalg')
                                                                           collect2 = false
                                                                       
                                                                          
                                                                          end
                                                                        end
                                                                      end
                                                                  end)

                                                                  Citizen.CreateThread(function()
                                                                    while true do 
                                                                      Citizen.Wait(0) 
                                                                      local player = GetPlayerPed(-1)
                                                                      local coord = GetEntityCoords(player)
                                                                      if GetDistanceBetweenCoords(-2036.3176269531,-1033.9346923828,5.8823590278625, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                                  
                                                                           DrawText3D(-2036.3176269531,-1033.9346923828,5.8823590278625 + 0.06, "~b~[E]~s~ - Sælg Amfetamin (~r~x10~w~)")
                                                                           if(IsControlJustReleased(1, 44))then
                                                                            collect = true
                                                                            loadAnimDict("mp_common")
                                                                            TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                                           exports['progressBars']:startUI(100000, "Sælger Amfetamin x10")
                                                                           Citizen.Wait(100000)
                                                                           ClearPedTasksImmediately(GetPlayerPed(-1))
                                                                           TriggerServerEvent('AMFsaalg2')
                                                                           collect = false
                                                                       
                                                                          
                                                                          end
                                                                        end
                                                                      end
                                                                  end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  -- Blomster


                                                                  Citizen.CreateThread(function()
                                                                    while true do 
                                                                     Citizen.Wait(0) 
                                                                    local ply = GetPlayerPed(-1)
                                                                  local plyCoords = GetEntityCoords(ply, 0)
                                                               for _, item in pairs(blomster) do
                                                               local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
                                                                if(distance <= 1) then
                                                          DrawText3D(item.x, item.y, item.z, "~b~[E]~s~ - Høst Blomster")
                                                         if(IsControlJustReleased(1, 51))then
                                                          collect2 = true
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_GARDENER_PLANT', 0, true)
                                                         exports['progressBars']:startUI(10000, "Høster Blomster")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('HøstBlomster')
                                                         collect2 = false
                                                     
                                                         end
                                                        end
                                                      end
                                                    end
                                                end)       

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                   Citizen.Wait(0) 
                                                  local ply = GetPlayerPed(-1)
                                                local plyCoords = GetEntityCoords(ply, 0)
                                             for _, item in pairs(blomster) do
                                             local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
                                              if(distance <= 1) then
                                        DrawText3D(item.x, item.y, item.z + 0.06, "~b~[Q]~s~ - Høst Blomster (~r~x10~w~)")
                                       if(IsControlJustReleased(1, 44))then
                                        collect = true
                                        TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_GARDENER_PLANT', 0, true)
                                       exports['progressBars']:startUI(100000, "Høster Blomster x10")
                                       Citizen.Wait(100000)
                                       ClearPedTasksImmediately(GetPlayerPed(-1))
                                       TriggerServerEvent('HøstBlomster2')
                                       collect = false
                                   
                                       end
                                      end
                                    end
                                  end
                              end) 
                                                
                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1) -- 1443.0721435547,y=6332.310546875,z=23.981895446777,
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(1443.0721435547,6332.310546875,23.981895446777, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(1443.0721435547,6332.310546875,23.981895446777, "~b~[E]~s~ - Kog Blomster")
                                                         if(IsControlJustReleased(1, 51))then
                                                          collect2 = true
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(10000, "Koger Blomster")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('KogBlomster')
                                                         collect2 = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)  

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1) -- 1443.0721435547,y=6332.310546875,z=23.981895446777,
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(1443.0721435547,6332.310546875,23.981895446777, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(1443.0721435547,6332.310546875,23.981895446777 + 0.06, "~b~[Q]~s~ - Kog Blomster (~r~x10~w~)")
                                                         if(IsControlJustReleased(1, 44))then
                                                          collect = true
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(100000, "Koger Blomster x10")
                                                         Citizen.Wait(100000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('KogBlomster2')
                                                         collect = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)  
                                                
                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player) -- -2.1932320594788,y=6653.5297851563,z=31.208330154419,
                                                    if GetDistanceBetweenCoords(-2.1932320594788,6653.5297851563,31.208330154419, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(-2.1932320594788,6653.5297851563,31.208330154419, "~b~[E]~s~ - Snit Blomster")
                                                         if(IsControlJustReleased(1, 51))then
                                                          collect2 = true
                                                          loadAnimDict("mp_common")
                                                          TaskPlayAnim(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(10000, "Snitter Blomster")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('SnitBlomster')
                                                         TriggerServerEvent('SnitBlomster2')
                                                         collect2 = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player) -- -2.1932320594788,y=6653.5297851563,z=31.208330154419,
                                                    if GetDistanceBetweenCoords(-2.1932320594788,6653.5297851563,31.208330154419, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(-2.1932320594788,6653.5297851563,31.208330154419 + 0.06, "~b~[Q]~s~ - Snit Blomster (~r~x10~w~)")
                                                         if(IsControlJustReleased(1, 44))then
                                                          collect = true
                                                          loadAnimDict("mp_common")
                                                          TaskPlayAnim(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(100000, "Snitter Blomster x10")
                                                         Citizen.Wait(100000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('SnitBlomster21')
                                                         TriggerServerEvent('SnitBlomster22')
                                                         collect = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(1296.9281005859,1453.1201171875,99.449394226074, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(1296.9281005859,1453.1201171875,99.449394226074, "~b~[E]~s~ - Aflever Blomster")
                                                         if(IsControlJustReleased(1, 51))then
                                                          collect2 = true
                                                          loadAnimDict("mp_common")
                                                          TaskStartScenarioInPlace(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                         exports['progressBars']:startUI(10000, "Afleverer Blomster")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('AfleverBlomster')
                                                         collect2 = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(1296.9281005859,1453.1201171875,99.449394226074, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(1296.9281005859,1453.1201171875,99.449394226074 + 0.06, "~b~[Q]~s~ - Aflever Blomster (~r~x10~w~)")
                                                         if(IsControlJustReleased(1, 44))then
                                                          collect = true
                                                          loadAnimDict("mp_common")
                                                          TaskStartScenarioInPlace(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                         exports['progressBars']:startUI(100000, "Afleverer Blomster x10")
                                                         Citizen.Wait(100000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('AfleverBlomster2')
                                                         collect = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  -- Hvidvask

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(1122.6550292969,-3196.8559570313,-40.396881103516, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(1122.6550292969,-3196.8559570313,-40.396881103516, "~b~[E]~s~ - Hvidvask Penge")
                                                         if(IsControlJustReleased(1, 51))then
                                                          collect2 = true
                                                          TaskStartScenarioInPlace(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                         exports['progressBars']:startUI(10000, "Hvidvasker Penge")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('Hvidvask')
                                                         collect2 = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(1122.6550292969,-3196.8559570313,-40.396881103516, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(1122.6550292969,-3196.8559570313,-40.396881103516 + 0.06, "~b~[Q]~s~ - Hvidvask Penge (~r~x5~w~)")
                                                         if(IsControlJustReleased(1, 44))then
                                                          collect3 = true
                                                          TaskStartScenarioInPlace(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                         exports['progressBars']:startUI(50000, "Hvidvasker Penge x5")
                                                         Citizen.Wait(50000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('Hvidvask2')
                                                         collect3 = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)

                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(1122.6550292969,-3196.8559570313,-40.396881103516, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(1122.6550292969,-3196.8559570313,-40.396881103516 + 0.12, "~b~[F]~s~ - Hvidvask Penge (~r~x10~w~)")
                                                         if(IsControlJustReleased(1, 23))then
                                                          collect4 = true
                                                          TaskStartScenarioInPlace(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                         exports['progressBars']:startUI(100000, "Hvidvasker Penge x10")
                                                         Citizen.Wait(100000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('Hvidvask3')
                                                         collect4 = false
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  -- Aluminium

                                                                  Citizen.CreateThread(function()
                                                                    while true do 
                                                                     Citizen.Wait(0) 
                                                                    local ply = GetPlayerPed(-1)
                                                                  local plyCoords = GetEntityCoords(ply, 0)
                                                               for _, item in pairs(aluminium) do
                                                               local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
                                                                if(distance <= 1) then
                                                          DrawText3D(item.x, item.y, item.z, "~b~[E]~s~ - Udvind Aluminium Oxide")
                                                         if(IsControlJustReleased(1, 51))then
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CONST_DRILL', 0, true)
                                                         exports['progressBars']:startUI(10000, "Udvinder Aluminium Oxide")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('Aluminium')
                                                     
                                                         end
                                                        end
                                                      end
                                                    end
                                                end)       
                                                
                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(1087.8718261719,-2001.8940429688,30.87518119812, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(1087.8718261719,-2001.8940429688,30.87518119812, "~b~[E]~s~ - Smelt Aluminium Oxide")
                                                         if(IsControlJustReleased(1, 51))then
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(10000, "Smelter Aluminium")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('AluminiumBar')
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)  
                                                
                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(107.78172302246,-934.28332519532,29.774265289306, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(107.78172302246,-934.28332519532,29.774265289306, "~b~[E]~s~ - Sælg Aluminium Bar")
                                                         if(IsControlJustReleased(1, 51))then
                                                          loadAnimDict("mp_common")
                                                          TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                         exports['progressBars']:startUI(10000, "Sælger Aluminium Bar")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('SælgAluminium')
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  -- Guld

                                                                  Citizen.CreateThread(function()
                                                                    while true do 
                                                                     Citizen.Wait(0) 
                                                                    local ply = GetPlayerPed(-1)
                                                                  local plyCoords = GetEntityCoords(ply, 0)
                                                               for _, item in pairs(guld) do
                                                               local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
                                                                if(distance <= 1) then
                                                          DrawText3D(item.x, item.y, item.z, "~b~[E]~s~ - Udvind Guldmalm")
                                                         if(IsControlJustReleased(1, 51))then
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CONST_DRILL', 0, true)
                                                         exports['progressBars']:startUI(10000, "Udvinder Guldmalm")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('Guld')
                                                     
                                                         end
                                                        end
                                                      end
                                                    end
                                                end)       
                                                
                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(1085.0635986328,-2002.1551513672,31.429588317871, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(1085.0635986328,-2002.1551513672,31.429588317871, "~b~[E]~s~ - Smelt Guldmalm")
                                                         if(IsControlJustReleased(1, 51))then
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(10000, "Smelter Guldmalm")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('GuldBar')
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)  
                                                
                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(109.35730743408,-929.24609375,29.8268699646, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(109.35730743408,-929.24609375,29.8268699646, "~b~[E]~s~ - Sælg Guld Bar")
                                                         if(IsControlJustReleased(1, 51))then
                                                          loadAnimDict("mp_common")
                                                          TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                         exports['progressBars']:startUI(10000, "Sælger Guld Bar")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('SælgGuld')
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  -- Stål

                                                                  Citizen.CreateThread(function()
                                                                    while true do 
                                                                     Citizen.Wait(0) 
                                                                    local ply = GetPlayerPed(-1)
                                                                  local plyCoords = GetEntityCoords(ply, 0)
                                                               for _, item in pairs(stol) do
                                                               local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
                                                                if(distance <= 1) then
                                                          DrawText3D(item.x, item.y, item.z, "~b~[E]~s~ - Udvind Stål")
                                                         if(IsControlJustReleased(1, 51))then
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CONST_DRILL', 0, true)
                                                         exports['progressBars']:startUI(10000, "Udvinder Stål")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('Stål')
                                                     
                                                         end
                                                        end
                                                      end
                                                    end
                                                end)       
                                                
                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(1087.7242431641,-2004.9129638672,31.153045654297, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(1087.7242431641,-2004.9129638672,31.153045654297, "~b~[E]~s~ - Smelt Stål")
                                                         if(IsControlJustReleased(1, 51))then
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(10000, "Smelter Stål")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('StålBar')
                                                         TriggerServerEvent('StålBar1')
                                                         TriggerServerEvent('StålBar2')
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)  
                                                
                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player)
                                                    if GetDistanceBetweenCoords(105.80088043213,-938.52996826172,29.736600875854, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(105.80088043213,-938.52996826172,29.736600875854, "~b~[E]~s~ - Sælg Rustfrit Stål")
                                                         if(IsControlJustReleased(1, 51))then
                                                          loadAnimDict("mp_common")
                                                          TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                         exports['progressBars']:startUI(10000, "Sælger Rustfrit Stål")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('StålSælg')
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  -- Kul/Diamanter

                                                                  Citizen.CreateThread(function()
                                                                    while true do 
                                                                     Citizen.Wait(0) 
                                                                    local ply = GetPlayerPed(-1)
                                                                  local plyCoords = GetEntityCoords(ply, 0)
                                                               for _, item in pairs(kul) do
                                                               local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
                                                                if(distance <= 1) then
                                                          DrawText3D(item.x, item.y, item.z, "~b~[E]~s~ - Udvind Kul")
                                                         if(IsControlJustReleased(1, 51))then
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CONST_DRILL', 0, true)
                                                         exports['progressBars']:startUI(10000, "Udvinder Kul")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('Kul')
                                                     
                                                         end
                                                        end
                                                      end
                                                    end
                                                end)       
                                                
                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player) -- 1108.8762207032,y=-2007.5161132812,z=30.903173446656
                                                    if GetDistanceBetweenCoords(1109.9221191406,-2008.1363525391,31.058889389038, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(1109.9221191406,-2008.1363525391,31.058889389038, "~b~[E]~s~ - Kompres Kul")
                                                         if(IsControlJustReleased(1, 51))then
                                                          TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                                                         exports['progressBars']:startUI(10000, "Kompresser Kul")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('Diamant')
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)  
                                                
                                                Citizen.CreateThread(function()
                                                  while true do 
                                                    Citizen.Wait(0) 
                                                    local player = GetPlayerPed(-1)
                                                    local coord = GetEntityCoords(player) 
                                                    if GetDistanceBetweenCoords(-622.01745605468,-230.66743469238,38.057067871094, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
                                                
                                                         DrawText3D(-622.01745605468,-230.66743469238,38.057067871094, "~b~[E]~s~ - Sælg Diamant")
                                                         if(IsControlJustReleased(1, 51))then
                                                          loadAnimDict("mp_common")
                                                          TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, 8.0, -1, 1, 0, false, false, false)
                                                         exports['progressBars']:startUI(10000, "Sælger Diamant")
                                                         Citizen.Wait(10000)
                                                         ClearPedTasksImmediately(GetPlayerPed(-1))
                                                         TriggerServerEvent('SælgDiamant')
                                                     
                                                        
                                                        end
                                                      end
                                                    end
                                                end)


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  -- Vindruer
                                                              

function DrawText3D(x, y, z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local px, py, pz = table.unpack(GetGameplayCamCoords())

  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(text)
  DrawText(_x, _y)
      local factor = (string.len(text)) / 370
  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 100)
end