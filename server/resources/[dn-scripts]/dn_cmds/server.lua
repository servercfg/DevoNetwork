local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_cancer")

AddEventHandler('chatMessage', function(source, name, message)

        splitmessage = stringsplit(message, " ");

        if string.lower(splitmessage[1]) == "/hjælp" or string.lower(splitmessage[1]) == "/help" then
            CancelEvent()
            TriggerClientEvent('chatMessage', source, "Hjælp 1: ", {255, 0, 0}, "/tweet, /twitter, /twt - Skriv et tweet!")
            TriggerClientEvent('chatMessage', source, "Hjælp 2: ", {255, 0, 0}, "/me - Skriv en handling du gør RP-mæssigt")
            TriggerClientEvent('chatMessage', source, "Hjælp 3: ", {255, 0, 0}, "/k - Overgiver dig til politiet, går på knæ med hænderne bag hovedet")
            TriggerClientEvent('chatMessage', source, "Hjælp 4: ", {255, 0, 0}, "Brug F9 for at åbne din menu.")
        elseif string.lower(splitmessage[1]) == "/stopr" or string.lower(splitmessage[1]) == "/stopr" then
            CancelEvent()
            TriggerClientEvent("pNotify:SendNotification", source,{text = "", type = "error", queue = "global", timeout = 1, layout = "topLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer=true})
        elseif string.lower(splitmessage[1]) == "/tweet" or string.lower(splitmessage[1]) == "/twitter" or string.lower(splitmessage[1]) == "/twt" then
            local nuser_id = vRP.getUserId({source})
			CancelEvent()
            if nuser_id ~= nil then
                vRP.getUserIdentity({nuser_id, function(identity)
					if identity then
                        local efternavn = string.gsub(identity.name, "%s", "")
                        local fornavn = string.gsub(identity.firstname, "%s", "")
						if vRP.hasInventoryItem({nuser_id, "phone"}) or vRP.hasInventoryItem({nuser_id, "phone1"})  then
							vRPclient.isInComa(source,{}, function(in_coma)
								if in_coma then
								TriggerClientEvent('chatMessage', source, "^5TWEET ^0| ^1Døde mennesker tweeter ikke.")
								else
									TriggerClientEvent('chatMessage', -1, "^5TWEET ^0| @" ..string.lower(fornavn).. "_" ..string.lower(efternavn), {0, 172, 237}, string.sub(message,string.len(splitmessage[1])+1))
								end
							end)
						else
							TriggerClientEvent('chatMessage', source, "^5TWEET ^0| ^1Du har ikke en telefon.")
						end
                    end
                end})
            end


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