vrpMySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_license")

vrpMySQL.createCommand("vRP/license_search", "SELECT * FROM vrp_users WHERE id = @id AND DmvTest = '1'")

local choice_asklc = {function(player,choice)
	local user_id = vRP.getUserId({player})
	vRPclient.getNearestPlayer(player,{10},function(nplayer)
	  local nuser_id = vRP.getUserId({nplayer})
		if nuser_id ~= nil then
			-- vRPclient.notify(player,{"Spørger om kørekort"})
			TriggerClientEvent("pNotify:SendNotification", player,{text ="Spørger om sundhedskort.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			vRP.request({nplayer,"Vil du vise dit sundhedskort?",15,function(nplayer,ok)
				if ok then
					vRP.getUserIdentity({nuser_id, function(identity)
						if identity then
							-- display identity and business
							local name = identity.name
							local firstname = identity.firstname
							local age = identity.age
							local registration = identity.registration
                            local license = "Ja"
							
							vrpMySQL.query("vRP/license_search", {id = nuser_id}, function(rows, affected)
								if #rows > 0 then
									license = "Nej"
								else
									license = "Godkendt"
								end
							end)
							
							vRP.getUserBusiness({nuser_id, function(business)
								if business then
									bname = business.name
									bcapital = business.capital
								end
						
								vRP.getUserAddress({nuser_id, function(address)
									if address then
									hhome = address.home
									hnumber = address.number
									else
									home = "Ukendt"
									number = "Ukendt"
									end
						
									local plysource = vRP.getUserSource({user_id})
						
									local user = {
										firstname = identity.firstname,
										name = identity.name,
										age = identity.age,
										registration = identity.registration,
										home = hhome,
										number = hnumber,
										job = vRP.getUserGroupByType({user_id,"job"})
									}

									local licensea = {
										license = license
									}
						
									local array = {
										user = user,
										licenses = licensea
									}
						
									TriggerClientEvent('identitycardd:show', plysource, array)
								end})
							end})
						end
					end})
				end
			end})
		end
	end)
end, "Tjek sundhedskort på nærmeste person."}

vRP.registerMenuBuilder({"main", function(add, data)
	local player = data.player
  
	local user_id = vRP.getUserId({player})
	if user_id ~= nil then
	  	local choices = {}
  
		-- user ask id
		if vRP.hasPermission({user_id, "user.askid"}) then
			choices["Spørg om Sundhedskort"] = choice_asklc
		end

		add(choices)
	end
end})