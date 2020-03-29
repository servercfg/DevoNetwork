local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_tvnews")

group = "Journalist-Job"
camPerm = "weazel.camera"
micPerm = "weazel.mic"

--[[local function cameraSettings(player, choice)
	--vRP.closeMenu({player})
	vRP.buildMenu({"Kamera Indstillinger", {player = player}, function(menu2)
		menu2.name = "Kamera Indstillinger"
		menu2.css={top="75px",header_color="rgba(235,0,0,0.75)"}
		menu2.onclose = function(player) vRP.openMenu({player, menu}) end

		menu2["Nyheds Titel"] = {function(player,choice)
			vRP.prompt({player, "News Title:", "", function(player,newsTitle)
				newsTitle = newsTitle
				vRPclient.notify(player, {"~g~Nyheds Titel: ~w~"..newsTitle})
				TriggerClientEvent("Cam:SetNewsTitle", player, newsTitle)
			end})
		end,"Skriv titlen på nyheden"}

		menu2["Overskrift"] = {function(player,choice)
			vRP.prompt({player, "Overskrift:", "", function(player,topTitle)
				topTitle = topTitle
				vRPclient.notify(player, {"~g~Overskrift: ~w~"..topTitle})
				TriggerClientEvent("Cam:SetTopTitle", player, topTitle)
			end})
		end,"Skriv overskriften"}

		menu2["Nederste Titel"] = {function(player,choice)
			vRP.prompt({player, "Nederste Titel:", "", function(player,botTitle)
				botTitle = botTitle
				vRPclient.notify(player, {"~g~Nederste Titel: ~w~"..botTitle})
				TriggerClientEvent("Cam:SetBotTitle", player, botTitle)
			end})
		end,"Skriv den nederste titel"}
		vRP.openMenu({player, menu2})
	end})

end]]


local cameraSettings = {function(player,choice)
	local menu2 = {}
	menu2.name = "Kamera Indstillinger"
	menu2.css = {top = "75px", header_color = "rgba(100, 0, 0,0.75)"}
	menu2.onclose = function(player) vRP.openMainMenu({player}) end -- nest menu

	menu2["Nyheds Titel"] = {function(player,choice)
		vRP.prompt({player, "News Title:", "", function(player,newsTitle)
			newsTitle = newsTitle
			vRPclient.notify(player, {"~g~Nyheds Titel: ~w~"..newsTitle})
			TriggerClientEvent("Cam:SetNewsTitle", player, newsTitle)
		end})
	end,"Skriv titlen på nyheden"}

	menu2["Overskrift"] = {function(player,choice)
		vRP.prompt({player, "Overskrift:", "", function(player,topTitle)
			topTitle = topTitle
			vRPclient.notify(player, {"~g~Overskrift: ~w~"..topTitle})
			TriggerClientEvent("Cam:SetTopTitle", player, topTitle)
		end})
	end,"Skriv overskriften"}

	menu2["Nederste Titel"] = {function(player,choice)
		vRP.prompt({player, "Nederste Titel:", "", function(player,botTitle)
			botTitle = botTitle
			vRPclient.notify(player, {"~g~Nederste Titel: ~w~"..botTitle})
			TriggerClientEvent("Cam:SetBotTitle", player, botTitle)
		end})
	end,"Skriv den nederste titel"}
	vRP.openMenu({player, menu2})
end, "Kamera Indstillinger"}


vRP.registerMenuBuilder({"main", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		if vRP.hasGroup({user_id, group}) then
			choices["Journalist"] = {function(player,choice)
				vRP.buildMenu({"Journalist", {player = player}, function(menu)
					menu.name = "Journalist"
					menu.css={top="75px",header_color="rgba(100, 0, 0,0.75)"}

					if vRP.hasPermission({user_id, camPerm}) then
						menu["Nyheds kamera"] = {function(player,choice)
							TriggerClientEvent("Cam:ToggleCam", player)
						end,"Brug film kameraet"}

						menu["Kamera Indstillinger"] = cameraSettings
					end

					if vRP.hasPermission({user_id, micPerm}) then
						menu["Mikrofon"] = {function(player,choice)
							TriggerClientEvent("Mic:ToggleMic", player)
						end,"Brug mikrofonen"}
					end

					vRP.openMenu({player, menu})
				end})
			end, "Journalist Menuen"}
		end
		add(choices)
	end
end})