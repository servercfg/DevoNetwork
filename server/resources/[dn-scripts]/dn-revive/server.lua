local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","dn-revive")

local a_revive = {function(player,choice) 
	vRP.prompt({player,"Spiller ID:","",function(player,target_id) 
		if target_id ~= nil and target_id ~= "" then 
			local nplayer = vRP.getUserSource({tonumber(target_id)})
			vRPclient.isInComa(nplayer,{}, function(in_coma)
				if in_coma then
					vRPclient.varyHealth(nplayer,{100}) 
					SetTimeout(150, function()
						vRPclient.varyHealth(nplayer,{100})
						vRP.varyHunger({target_id,-100})
						vRP.varyThirst({target_id,-100})
					end)
					vRPclient.notify(nplayer,{"Du er blevet genoplivet af ~g~"..GetPlayerName(player)})
					vRPclient.notify(player,{"Du har genoplivet ~g~"..GetPlayerName(nplayer)})
				else
					vRPclient.notify(player,{"~r~Spiller ikke i bevidstløs!"})
				end
			end)
		else
			vRPclient.notify(player,{"~r~Intet spiller ID skrevet."})
		end 
	end})
end,"Genopliv bevidstløs spiller."}

vRP.registerMenuBuilder({"admin", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
	
		if vRP.hasPermission({user_id,"admin.revive"}) then
			choices["Admin Genopliv"] = a_revive
		end
		add(choices)
	end
end})