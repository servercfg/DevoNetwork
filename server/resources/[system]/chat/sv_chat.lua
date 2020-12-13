local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_chatroles")

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");

	local user_id = vRP.getUserId({source})

	if string.lower(sm[1]) == "/meall" then
        CancelEvent()
        TriggerClientEvent('chatMessage', -1, "^3[GLOBAL HANDLING]^7 "..name.." | "..user_id.." | ^1" ..string.sub(msg,7))
	end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
        TriggerEvent("vrp-chat:chat_message",source,author,message)
        end

    print(author .. ': ' .. message)
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        if vRP.hasPermission({user_id,"player.phone"}) then
            TriggerClientEvent('chatMessage', player, "^2Denne ^1["..command.."]^2 er ikke tilgængelig se tilgængelige kommandoer ved at trykke DEL")
        else
            --TriggerClientEvent('chatMessage', -1, "^1[OOC]^0 " .. name .. " - [ID - "..user_id.."] ", { 128, 128, 128 }, '/' .. command)
        end
    end

    CancelEvent()
end)

-- player join messages
-- AddEventHandler('playerConnecting', function()
-- TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) .. ' joined.')
-- end)

-- AddEventHandler('playerDropped', function(reason)
-- TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) ..' left (' .. reason .. ')')
-- end)

RegisterCommand('say', function(source, args, rawCommand)
    TriggerClientEvent('chatMessage', -1, (source == 0) and 'SERVER' or GetPlayerName(source), { 255, 255, 255 }, rawCommand:sub(5))
end)

AddEventHandler('chatMessage', function(source, name, message)
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest('https://discordapp.com/api/webhooks/640570286714126356/PiDb63Hmcqt3ygDyvdWkSdIEitEndAN0YuHju2StFgfIRt9lqcFwzwxDkIEaJ78b8ee_', function(err, text, headers) end, 'POST', json.encode({username = "Chatlog - " .. name, content = message}), { ['Content-Type'] = 'application/json' })
end)
