local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","dn-custom")

AddEventHandler('chatMessage', function(source, name, message)
  splitmessage = stringsplit(message, " ")
	if string.lower(splitmessage[1]) == "/dsupport" then
		local user_id = vRP.getUserId({source})
		CancelEvent()
		if user_id ~= nil then
		  if vRP.hasPermission({user_id,"player.kick"}) then
				vRP.prompt({source,"ID:","",function(source,nuser_id)
					if nuser_id ~= nil and nuser_id ~= "" and tonumber(nuser_id) > 0 and tonumber(nuser_id) then
						local nsource = vRP.getUserSource({tonumber(nuser_id)})
						TriggerClientEvent("pNotify:SendNotification", nsource,{text = "<center><h2>Du bedes venligst at sætte dig i afventer support inden for 10 min, ellers Ban</h2></center>", type = "error", queue = "global", timeout = 600000, layout = "center",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
						TriggerClientEvent("pNotify:SendNotification", source,{text = "Advarsel sendt [Når denne går væk er der gået 10min]",type = "info",timeout = (600000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
						local dname = "[ ID: ".. tostring(user_id).. " ] - Server | dsupport"
						local dmessage = "**[ ID: ".. tostring(user_id).. " ]** sendte discord advarsle til **[ ID: " .. tostring(nuser_id).. " ]**."
						PerformHttpRequest('https://discordapp.com/api/webhooks/644483281550573578/0ugMzpbv7MB2eQkxh0BOXwLuaF-kzmA3WxJc9Tf9voAmky_U_GXSDmFetz2HMkeEfLoA', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
					else
						TriggerClientEvent("pNotify:SendNotification", source,{text = "Ugyldigt eller manglende ID", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
					end
				end})
			else
				TriggerClientEvent("pNotify:SendNotification", source,{text = "<center><h2>Du skal være staff for at bruge den her command</h2></center>",type = "info",timeout = (5000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end
		end
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