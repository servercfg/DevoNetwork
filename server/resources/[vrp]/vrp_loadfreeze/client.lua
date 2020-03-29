local frozen = true
local loading = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if frozen == true then
			SetEntityInvincible(GetPlayerPed(-1),true)
			SetEntityVisible(GetPlayerPed(-1),false)
			FreezeEntityPosition(GetPlayerPed(-1),true)
		end
	end
end)

AddEventHandler("playerSpawned",function()
    loading = true
    InitialSetup()
    Wait(15000)
    loading = false
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if loading then
			LoadInterior(137473)
			RefreshInterior(137473)
		end
	end
end)

function InitialSetups()
    SwitchOutPlayer(PlayerPedId(), 0, 1)
    MovePlayer()
end

function InitialSetup()
    SwitchOutPlayer(PlayerPedId(), 0, 1)
end

function MovePlayer()
    Wait(5000)
    SetPlayer()
    Wait(2000)
    frozen = false
    SetEntityInvincible(GetPlayerPed(-1), false)
    SetEntityVisible(GetPlayerPed(-1), true, false)
    FreezeEntityPosition(GetPlayerPed(-1),false)
end

function SetPlayer()
    SwitchInPlayer(PlayerPedId())
end

RegisterNetEvent("movebitch")
AddEventHandler("movebitch", function()
    InitialSetups()
end)