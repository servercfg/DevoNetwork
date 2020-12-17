RegisterNetEvent('proximityMessage')
AddEventHandler('proximityMessage', function(author, name, color, distance, message)
	x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1),false))
	a, b, c = table.unpack(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(author)),false))
    if GetDistanceBetweenCoords(x,y,z,a,b,c,true) < distance then
        TriggerEvent('chatMessage', name, color, message)
    end
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/twitter', '"/twitter <besked>"')
end)