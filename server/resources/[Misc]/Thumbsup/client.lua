-------------------Brug: Y-----------------------
Citizen.CreateThread(function()
local dict = "anim@mp_player_intincarthumbs_upbodhi@ps@"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	                    end
    local thumbsup = false
	while true do
		Citizen.Wait(0)
		if IsControlPressed(0, 246) then
            if not thumbsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "enter", 8.0, 8.0, -1, 50, 0, false, false, false)
                thumbsup = true
            else
                thumbsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end end)
	