Citizen.CreateThread(function()
  while true do
  Citizen.Wait(1)
    local ped = GetPlayerPed(-1)
    local vehtypes = {"car", "bike", "citybike", "default"}
    if IsControlPressed(0,182) then
      if tvRP.getNearestOwnedVehicle(8) ~= null then
        if not ok then
          for _,v in pairs(vehtypes) do
            tvRP.vc_toggleLock(v)
          end
          Citizen.Wait(2000)
        else
          Citizen.Wait(2000)
        end
      end
    end
    if IsControlPressed(0,167) then
        if tvRP.getNearestOwnedVehicle(5) ~= null then
		 if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
         local veh = "car"
          tvRP.vc_NeonToggle(veh)
         Citizen.Wait(1000)
        else
         Citizen.Wait(500)
        end
      end
	end
  end
end)