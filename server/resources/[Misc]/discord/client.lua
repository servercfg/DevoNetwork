

Citizen.CreateThread(function() TriggerEvent('chat:addSuggestion', '/discord', 'Viser discord link.') end)
RegisterCommand("discord", function(source, args, rawCommandString)
    TriggerEvent('chatMessage', "^1[DEVONETWORK]", { 255, 0, 62 }, "Discord link | https://discord.gg/9JXJ2Df")
end, false)

