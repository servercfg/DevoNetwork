-- with this you can turn on/off specific anticheese components, note: you can also turn these off while the script is running by using events, see examples for such below
Components = {
	Teleport = false, --Due too the hospital/apartments teleporting to a different location it will mark a false positive. This is turned off to prevent spam.
	GodMode = false,
	Speedhack = false,
	WeaponBlacklist = true,
	CustomFlag = true,
	VehicleBlacklist = true,
}

--[[
event examples are:

anticheese:SetComponentStatus( component, state )
	enables or disables specific components
		component:
			an AntiCheese component, such as the ones listed above, must be a string
		state:
			the state to what the component should be set to, accepts booleans such as "true" for enabled and "false" for disabled


anticheese:ToggleComponent( component )
	sets a component to the opposite mode ( e.g. enabled becomes disabled ), there is no reason to use this.
		component:
			an AntiCheese component, such as the ones listed above, must be a string

anticheese:SetAllComponents( state )
	enables or disables **all** components
		state:
			the state to what the components should be set to, accepts booleans such as "true" for enabled and "false" for disabled


These can be used by triggering them like following:
	TriggerEvent("anticheese:SetComponentStatus", "Teleport", false)

Triggering these events from the clientside is not recommended as these get disabled globally and not just for one player.


]]


Users = {}
violations = {}





RegisterServerEvent("anticheese:timer")
AddEventHandler("anticheese:timer", function()
	if Users[source] then
		if (os.time() - Users[source]) < 15 and Components.Speedhack then -- prevent the player from doing a good old cheat engine speedhack
			DropPlayer(source, "Speedhacking")
		else
			Users[source] = os.time()
		end
	else
		Users[source] = os.time()
	end
end)

--[[
AddEventHandler('playerDropped', function() -- Again, we do not want this system to be kicking people.
	if(Users[source])then
		Users[source] = nil
	end
end)

RegisterServerEvent("anticheese:kick")
AddEventHandler("anticheese:kick", function(reason)
	DropPlayer(source, reason)
end)
]]

AddEventHandler("anticheese:SetComponentStatus", function(component, state)
	if type(component) == "string" and type(state) == "boolean" then
		Components[component] = state -- changes the component to the wished status
	end
end)

AddEventHandler("anticheese:ToggleComponent", function(component)
	if type(component) == "string" then
		Components[component] = not Components[component]
	end
end)

AddEventHandler("anticheese:SetAllComponents", function(state)
	if type(state) == "boolean" then
		for i,theComponent in pairs(Components) do
			Components[i] = state
		end
	end
end)

Citizen.CreateThread(function()
	webhook = GetConvar("ac_webhook", "none")


	function SendWebhookMessage(webhook,message)
		if webhook ~= "none" then
			PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
		end
	end

	function WarnPlayer(playername, reason)
		local isKnown = false
		local isKnownCount = 1
		local isKnownExtraText = ""
		for i,thePlayer in ipairs(violations) do
			if thePlayer.name == name then
				isKnown = true
				if violations[i].count == 3 then
					TriggerEvent("obama", source,"Cheating") -- We do not want the system automatically banning people.
					isKnownCount = violations[i].count
					table.remove(violations,i)
					isKnownExtraText = ""
				else
					violations[i].count = violations[i].count+1
					isKnownCount = violations[i].count
				end
			end
		end

		if not isKnown then
			table.insert(violations, { name = name, count = 1 })
		end

		return isKnown, isKnownCount,isKnownExtraText
	end

	function GetPlayerNeededIdentifiers(player)
		local ids = GetPlayerIdentifiers(player)
		for i,theIdentifier in ipairs(ids) do
			if string.find(theIdentifier,"license:") or -1 > -1 then
				license = theIdentifier
			elseif string.find(theIdentifier,"steam:") or -1 > -1 then
				steam = theIdentifier
			end
		end
		if not steam then
			steam = "steam: missing"
		end
		return license, steam
	end

	RegisterServerEvent('AntiCheese:SpeedFlag')
	AddEventHandler('AntiCheese:SpeedFlag', function(rounds, roundm)
		if Components.Speedhack and not IsPlayerAceAllowed(source,"anticheese.bypass") then
			license, steam = GetPlayerNeededIdentifiers(source)

			name = GetPlayerName(source)

			isKnown, isKnownCount, isKnownExtraText = WarnPlayer(name,"Speed Hacking")

			SendWebhookMessage(webhook, "**Speed Hacker! - Server 1** \n```\nUser:"..name.."\nId:"..id.."\n"..license.."\n"..steam.."\nWas travelling "..rounds.. " units. That's "..roundm.." more than normal! \nAnticheat Flags:"..isKnownCount..""..isKnownExtraText.." ```")
		end
	end)



	RegisterServerEvent('AntiCheese:NoclipFlag')
	AddEventHandler('AntiCheese:NoclipFlag', function(distance)
		if Components.Speedhack and not IsPlayerAceAllowed(source,"anticheese.bypass") then
			license, steam = GetPlayerNeededIdentifiers(source)
			name = GetPlayerName(source)
			local id = source

			isKnown, isKnownCount, isKnownExtraText = WarnPlayer(name,"Noclip/Teleport Hacking")


			SendWebhookMessage(webhook,"**Noclip/Teleport! - Server 1** \n```\nUser:"..name.."\nId:"..id.."\n"..license.."\n"..steam.."\nCaught with "..distance.." units between last checked location\nAnticheat Flags:"..isKnownCount..""..isKnownExtraText.." ```")
		end
	end)
	
	
	RegisterServerEvent('AntiCheese:CustomFlag')
	AddEventHandler('AntiCheese:CustomFlag', function(reason,extrainfo)
		if Components.CustomFlag and not IsPlayerAceAllowed(source,"anticheese.bypass") then
			license, steam = GetPlayerNeededIdentifiers(source)
			name = GetPlayerName(source)
			if not extrainfo then extrainfo = "no extra informations provided" end
			isKnown, isKnownCount, isKnownExtraText = WarnPlayer(name,reason)


			SendWebhookMessage(webhook,"**"..reason.."** \n```\nUser:"..name.."\nId:"..id.."\n"..license.."\n"..steam.."\n"..extrainfo.."\n")
		end
	end)

	RegisterServerEvent('AntiCheese:HealthFlag')
	AddEventHandler('AntiCheese:HealthFlag', function(invincible,oldHealth, newHealth, curWait)
		if Components.GodMode and not IsPlayerAceAllowed(source,"anticheese.bypass") then
			license, steam = GetPlayerNeededIdentifiers(source)
			name = GetPlayerName(source)
			local id = source

			isKnown, isKnownCount, isKnownExtraText = WarnPlayer(name,"Health Hacking")

			if invincible then
				SendWebhookMessage(webhook,"**Health Hack! - Server 1** \n```\nUser:"..name.."\nId:"..id.."\n"..license.."\n"..steam.."\nRegenerated "..newHealth-oldHealth.."hp ( to reach "..newHealth.."hp ) in "..curWait.."ms! ( PlayerPed was invincible )\n```")
			else
				SendWebhookMessage(webhook,"**Health Hack! - Server 1** \n```\nUser:"..name.."\nId:"..id.."\n"..license.."\n"..steam.."\nRegenerated "..newHealth-oldHealth.."hp ( to reach "..newHealth.."hp ) in "..curWait.."ms! ( Health was Forced )\n```")
			end
		end
	end)

	RegisterServerEvent('AntiCheese:JumpFlag')
	AddEventHandler('AntiCheese:JumpFlag', function(jumplength)
		if Components.SuperJump and not IsPlayerAceAllowed(source,"anticheese.bypass") then
			license, steam = GetPlayerNeededIdentifiers(source)
			name = GetPlayerName(source)
			local id = source

			isKnown, isKnownCount, isKnownExtraText = WarnPlayer(name,"SuperJump Hacking")

			SendWebhookMessage(webhook,"**SuperJump Hack! - Server 1** \n```\nUser:"..name.."\nId:"..id.."\n"..license.."\n"..steam.."\nJumped "..jumplength.."ms long\n```")
		end
	end)

	RegisterServerEvent('AntiCheese:WeaponFlag')
	AddEventHandler('AntiCheese:WeaponFlag', function(theWeapon)
		if Components.WeaponBlacklist and not IsPlayerAceAllowed(source,"anticheese.bypass") then
			license, steam = GetPlayerNeededIdentifiers(source)
			name = GetPlayerName(source)
			local id = source

			isKnown, isKnownCount, isKnownExtraText = WarnPlayer(name,"Blacklisted Weapon")

			SendWebhookMessage(webhook,"**Blacklisted Weapon! - Server 1** \n```\nUser:"..name.."\nId:"..id.."\n"..license.."\n"..steam.."\nGot Weapon: "..theWeapon.."( Blacklisted )\n```")
		end
	end)
	
	RegisterServerEvent('AntiCheese:VehicleFlag')
	AddEventHandler('AntiCheese:VehicleFlag', function(carModel)
		if Components.VehicleBlacklist and not IsPlayerAceAllowed(source,"anticheese.bypass") then
			license, steam = GetPlayerNeededIdentifiers(source)
			name = GetPlayerName(source)
			local id = source

			isKnown, isKnownCount, isKnownExtraText = WarnPlayer(name,"Blacklisted Vehicle")

			SendWebhookMessage(webhook,"**Blacklisted Vehicle! - Server 1** \n```\nUser:"..name.."\nId:"..id.."\n"..license.."\n"..steam.."\nEntered Vehicle: "..carModel.." ( Blacklisted )\n```")
		end
	end)
end)